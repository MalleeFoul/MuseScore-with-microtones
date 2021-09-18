/*
 * SPDX-License-Identifier: GPL-3.0-only
 * MuseScore-CLA-applies
 *
 * MuseScore
 * Music Composition & Notation
 *
 * Copyright (C) 2021 MuseScore BVBA and others
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import MuseScore.Inspector 1.0
import MuseScore.UiComponents 1.0
import MuseScore.Ui 1.0

import "../../../common"

Column {
    id: root

    property PropertyItem lineStyle: null
    property PropertyItem dashLineLength: null
    property PropertyItem dashGapLength: null

    width: parent.width

    spacing: 16

    FlatRadioButtonGroupPropertyView {
        titleText: qsTrc("inspector", "Style")
        propertyItem: root.lineStyle

        model: [
            { iconCode: IconCode.LINE_NORMAL, value: LineTypes.LINE_STYLE_SOLID },
            { iconCode: IconCode.LINE_DASHED, value: LineTypes.LINE_STYLE_DASHED },
            { iconCode: IconCode.LINE_DOTTED, value: LineTypes.LINE_STYLE_DOTTED },
            { text: qsTrc("inspector", "Custom"), value: LineTypes.LINE_STYLE_CUSTOM }
        ]
    }

    Item {
        height: childrenRect.height
        width: parent.width

        InspectorPropertyView {
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.rightMargin: 2

            visible: root.dashLineLength && root.dashLineLength.isEnabled
            height: visible ? implicitHeight : 0

            titleText: qsTrc("inspector", "Dash")
            propertyItem: root.dashLineLength

            IncrementalPropertyControl {
                isIndeterminate: root.dashLineLength ? root.dashLineLength.isUndefined : false
                currentValue: root.dashLineLength ? root.dashLineLength.value : 0
                step: 0.1
                maxValue: 10
                minValue: 0.1
                decimals: 2

                onValueEdited: {
                    root.dashLineLength.value = newValue
                }
            }
        }

        InspectorPropertyView {
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: 2
            anchors.right: parent.right

            visible: root.dashGapLength && root.dashGapLength.isEnabled
            height: visible ? implicitHeight : 0

            titleText: qsTrc("inspector", "Gap")
            propertyItem: root.dashGapLength

            IncrementalPropertyControl {
                isIndeterminate: root.dashGapLength && enabled ? root.dashGapLength.isUndefined : false
                currentValue: root.dashGapLength ? root.dashGapLength.value : 0
                step: 0.1
                maxValue: 10
                minValue: 0.1
                decimals: 2

                onValueEdited: {
                    root.dashGapLength.value = newValue
                }
            }
        }
    }
}

