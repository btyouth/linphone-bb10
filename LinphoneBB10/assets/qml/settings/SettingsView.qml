/*
 * SettingsView.qml
 * Copyright (C) 2015  Belledonne Communications, Grenoble, France
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import bb.cascades 1.4

import ".."
import "../custom_controls"

Page {
    Container {
        layout: StackLayout {
            orientation: LayoutOrientation.TopToBottom
        }
        
        StatusBar {
            menuEnabled: false
        }
        
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            minHeight: ui.sdu(15)
            background: colors.colorF
            
            Container {
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1
                }
            }
            
            Container {
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 3
                }
                verticalAlignment: VerticalAlignment.Center
                
                Label {
                    text: qsTr("SETTINGS") + Retranslate.onLanguageChanged
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    textStyle.color: colors.colorA
                    textStyle.fontWeight: FontWeight.Bold
                    textStyle.fontSize: FontSize.XLarge
                    textStyle.base: titilliumWeb.style
                }
            }
            
            TopBarButton {
                imageSource: "asset:///images/assistant/dialer_back.png"
                
                gestureHandlers: TapHandler {
                    onTapped: {
                        navigationPane.pop();
                    }
                }
            }
        }
        
        Container {
            layout: DockLayout {
            
            }
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            
            ControlDelegate {
                id: settingsDelegate
                source: "SettingsHomeView.qml"
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill
            }
        }
    }
}
