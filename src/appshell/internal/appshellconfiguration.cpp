//=============================================================================
//  MuseScore
//  Music Composition & Notation
//
//  Copyright (C) 2021 MuseScore BVBA and others
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License version 2.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
//=============================================================================
#include "appshellconfiguration.h"

using namespace mu::appshell;

bool AppShellConfiguration::isAppUpdatable() const
{
#if defined(APP_UPDATABLE)
    return true;
#else
    return false;
#endif
}

mu::ValCh<QStringList> AppShellConfiguration::recentScoreList() const
{
    return userScoresConfiguration()->recentScoreList();
}