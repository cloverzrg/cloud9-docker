# cloud9-docker
cloud9 docker image

cloud9-core https://github.com/c9/core
## run

### simple
```
docker run -d -p 80:80 cloverzrg/cloud9 --auth username:password
```
You don't need to look at the following if you just try it

### recommend
```
docker run -d -m 256M -p 127.0.0.1:8090:80 -v $HOME/docker-volume/cloud9/workspace:/workspace -v $HOME/docker-volume/cloud9/user.settings:/root/.c9/user.settings cloverzrg/cloud9 --auth username:password
```
ensure that the folder have right permissions.
##### nginx conf
```
server {
    listen 80;
    server_name ide.example.com;
    location / {
        proxy_set_header   X-Real-IP $remote_addr;
        proxy_set_header   Host      $http_host;
        proxy_pass         http://127.0.0.1:8090;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "Upgrade";
        # support WebSocket
    }
}
```

##### user.settings example
```
{
    "ace": {
        "@animatedScroll": true,
        "@antialiasedfonts": false,
        "@behavioursEnabled": true,
        "@cursorStyle": "smooth slim",
        "@displayIndentGuides": true,
        "@fadeFoldWidgets": true,
        "@fontFamily": "Monaco, Menlo, Ubuntu Mono, Consolas, source-code-pro, monospace",
        "@fontSize": 14,
        "@highlightActiveLine": true,
        "@highlightGutterLine": true,
        "@highlightSelectedWord": true,
        "@keyboardmode": "default",
        "@mergeUndoDeltas": "off",
        "@overwrite": false,
        "@printMarginColumn": "80",
        "@scrollPastEnd": "0.5",
        "@scrollSpeed": "2",
        "@selectionStyle": "line",
        "@showFoldWidgets": true,
        "@showGutter": true,
        "@showInvisibles": false,
        "@showLineNumbers": true,
        "@showPrintMargin": true,
        "@theme": "ace/theme/cloud9_day",
        "@useWrapMode": false,
        "@wrapBehavioursEnabled": false,
        "@wrapToView": true,
        "custom-types": {
            "json()": {
                "settings": "javascript"
            }
        },
        "statusbar": {
            "@show": true
        }
    },
    "breakpoints": {
        "@active": "true"
    },
    "build": {
        "@autobuild": false
    },
    "collab": {
        "@showbubbles": "true"
    },
    "debug": {
        "@autoshow": true,
        "@pause": 0
    },
    "findinfiles": {
        "@clear": "true",
        "@consolelaunch": "false",
        "@fullpath": "false",
        "@project": "/",
        "@scrolldown": "false"
    },
    "general": {
        "@animateui": true,
        "@automerge": "false",
        "@confirmmerge": "true",
        "@downloadFilesAs": "auto",
        "@preview-navigate": "false",
        "@preview-tree": "false",
        "@revealfile": false,
        "@skin": "flat-light",
        "@treestyle": "alternative"
    },
    "imgeditor": {
        "@smooth": false,
        "@zoom": 100
    },
    "installer": {
        "@auto": false
    },
    "key-bindings": {
        "@platform": "auto",
        "@preset": "default"
    },
    "language": {
        "@continuousCompletion": true,
        "@enterCompletion": true,
        "@hints": true,
        "@instanceHighlight": true,
        "@overrideMultiselectShortcuts": "true"
    },
    "metadata": {
        "@undolimit": "100"
    },
    "openfiles": {
        "@hidetree": "false",
        "@show": false
    },
    "output": {
        "@backgroundColor": "#e0e5e7",
        "@foregroundColor": "#333333",
        "@keepOutput": "false",
        "@nosavequestion": "false",
        "@selectionColor": "#aebabf"
    },
    "preview": {
        "@default": "preview.browser",
        "@onSave": "false",
        "@running_app": "false"
    },
    "projecttree": {
        "@hiddenFilePattern": "*.pyc, __pycache__, .*",
        "@scope": "false",
        "@showhidden": false
    },
    "runconfig": {
        "@debug": "true",
        "@saveallbeforerun": "true",
        "@showruncfglist": "false"
    },
    "tabs": {
        "@asterisk": "false",
        "@autoclosepanes": true,
        "@show": true,
        "@title": "false"
    },
    "terminal": {
        "@antialiasedfonts": false,
        "@backgroundColor": "#eaf0f7",
        "@blinking": "false",
        "@defaultEnvEditor": "false",
        "@fontfamily": "Ubuntu Mono, Menlo, Consolas, monospace",
        "@fontsize": 14,
        "@foregroundColor": "#000000",
        "@scrollback": 1000,
        "@selectionColor": "#bed1e3",
        "noclosequestion": {
            "json()": "true"
        }
    },
    "tour": {
        "@default-complete": false
    },
    "welcome": {
        "@first": true
    }
}

```