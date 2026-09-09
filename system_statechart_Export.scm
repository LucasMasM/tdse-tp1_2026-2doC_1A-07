{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "type": "Statechart",
        "id": "00ffb6d1-d225-4bc0-8b73-7df9987f57b7",
        "attrs": {
          "name": {
            "text": "system_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\r\n@SuperSteps(no)\r\ninterface:\r\n\t// Eventos de entrada (Disparan las transiciones)\r\n\tin event EV_CAM_ON\r\n\tin event EV_BTN_ON\r\n\tin event EV_SNR_OFF\r\n\t\r\n\t// Eventos de salida (Las acciones que emites con 'raise')\r\n\tout event EV_ACT_BAROFF\r\n\tout event EV_ACT_SVR\r\n\tout event EV_ACT_DSP\r\n\tout event EV_ACT_TKT\r\n\tout event EV_ACT_BARON"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -218,
          "y": -125
        },
        "size": {
          "width": 112,
          "height": 68
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_SYS_OFF",
            "fontSize": 11
          },
          "specification": {
            "text": "entry/raise\nEV_ACT_BAROFF\n;raise EV_ACT_SVR"
          }
        },
        "id": "bb2dbc9d-1f82-4c5d-99e8-51da25e7fa36",
        "z": 6
      },
      {
        "position": {
          "x": 175,
          "y": -133
        },
        "size": {
          "width": 117,
          "height": 70
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_SYS_WAIT",
            "fontSize": 11
          },
          "specification": {
            "text": "entry/raise\nEV_ACT_TKT\n;raise EV_ACT_BARON"
          }
        },
        "id": "7a0d6ee0-1fd2-42d2-9c97-5a0aeb2a4028",
        "z": 18
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "7a0d6ee0-1fd2-42d2-9c97-5a0aeb2a4028"
        },
        "target": {
          "id": "bb2dbc9d-1f82-4c5d-99e8-51da25e7fa36",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "45.455%",
              "dy": "74.603%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SNR_OFF"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "f8ee4b28-51e5-4fdb-b26d-a7ae19a417a3",
        "z": 19,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 39,
            "y": -12
          },
          {
            "x": -2,
            "y": -12
          }
        ]
      },
      {
        "position": {
          "x": -305,
          "y": -100
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "1c44c223-b5b7-4e7f-a3c3-225eb7df75ba",
        "z": 25,
        "embeds": [
          "208ae5a8-b42c-4dac-9a7a-55d438e687e8"
        ]
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -305,
          "y": -85
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "208ae5a8-b42c-4dac-9a7a-55d438e687e8",
        "z": 26,
        "parent": "1c44c223-b5b7-4e7f-a3c3-225eb7df75ba"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "1c44c223-b5b7-4e7f-a3c3-225eb7df75ba"
        },
        "target": {
          "id": "bb2dbc9d-1f82-4c5d-99e8-51da25e7fa36",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "5.357%",
              "dy": "52.941%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "dc27e35e-90be-4ec7-b6a0-abf0af9b26f4",
        "z": 27,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -7,
          "y": -126
        },
        "size": {
          "width": 77,
          "height": 69
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_SYS_BTN",
            "fontSize": 11
          },
          "specification": {
            "text": "entry/raise\nEV_ACT_DSP"
          }
        },
        "id": "57308e2a-b6b5-4889-a082-ff1c75a264d5",
        "z": 28
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "bb2dbc9d-1f82-4c5d-99e8-51da25e7fa36"
        },
        "target": {
          "id": "57308e2a-b6b5-4889-a082-ff1c75a264d5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "3.896%",
              "dy": "52.174%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_CAM_ON"
              }
            },
            "position": {
              "distance": 0.4506172839506173,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "c9dbe66e-aee9-4002-b422-17661bca4d3e",
        "z": 29,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "57308e2a-b6b5-4889-a082-ff1c75a264d5"
        },
        "target": {
          "id": "7a0d6ee0-1fd2-42d2-9c97-5a0aeb2a4028",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "1.235%",
              "dy": "57.746%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_ON"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "e0633987-4fb4-4456-a08b-080b20962e8a",
        "z": 29,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "SystemStatechart",
          "statemachinePrefix": "systemStatechart",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": false,
          "exitState": false,
          "generic": false
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}