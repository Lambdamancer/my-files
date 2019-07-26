import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    xmproc <- spawnPipe "/nix/store/dnbq09qn4lbl82bfyq401xm2c1pflrzb-system-path/bin/xmobar /home/fmncr/.xmobarrc"
    xmonad $ defaultConfig
        { terminal = "urxvt"
        , borderWidth = 2
        , normalBorderColor  = "#cccccc"
        , focusedBorderColor = "#cd8b00"
        , manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock" )
        , ((controlMask, xK_Print),        spawn "sleep 0.2; scrot -s"        )
        , ((0, xK_Print),                  spawn "scrot"                      )
        , ((mod4Mask, xK_r),               spawn "urxvt -e ranger"            )
        , ((mod4Mask .|. shiftMask, xK_e), spawn "gksu '/etc/nixos/result/bin/emacs'"  )
        , ((mod4Mask .|. shiftMask, xK_r), spawn "gksu 'urxvt -e ranger'"     )        
        , ((mod4Mask, xK_e),               spawn "./result/bin/emacs"         )
        , ((mod4Mask, xK_f),               spawn "firefox"                    )
        ]




