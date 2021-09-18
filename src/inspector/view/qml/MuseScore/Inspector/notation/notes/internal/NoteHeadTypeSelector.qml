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

import MuseScore.UiComponents 1.0
import MuseScore.Ui 1.0
import MuseScore.Inspector 1.0

import "../../../common"

FlatRadioButtonGroupPropertyView {
    id: root
    titleText: qsTrc("inspector", "Notehead type")

    radioButtonGroup.height: 40
    model: [
        { text: qsTrc("inspector", "Auto"), value: NoteHead.TYPE_AUTO },
        { iconCode: IconCode.NOTE_HEAD_QUARTER, value: NoteHead.TYPE_QUARTER },
        { iconCode: IconCode.NOTE_HEAD_HALF, value: NoteHead.TYPE_HALF },
        { iconCode: IconCode.NOTE_HEAD_WHOLE, value: NoteHead.TYPE_WHOLE },
        { iconCode: IconCode.NOTE_HEAD_BREVIS, value: NoteHead.TYPE_BREVIS }
    ]

    radioButtonGroup.delegate: FlatRadioButtonGroupPropertyView.Delegate {
        iconFontSize: 30
    }
}
