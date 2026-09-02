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
            "text": "Sensor Statechart Export"
          },
          "specification": {
            "text": "@EventDriven\r\n@SuperSteps(no)\r\n\r\ninterface:\r\n    in event EV_BTN_HOLD\r\n    in event EV_BTN_FREE\r\n    out event EV_SYS_ON\r\n    out event EV_SYS_OFF\r\n"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -154,
          "y": -125
        },
        "size": {
          "width": 102,
          "height": 61
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_UP",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / raise EV_SYS_OFF"
          }
        },
        "id": "a9b7dcd7-a471-4627-8347-18abe38d2eea",
        "z": 2
      },
      {
        "position": {
          "x": 138,
          "y": -125
        },
        "size": {
          "width": 96,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_FALL",
            "fontSize": 11
          }
        },
        "id": "5a20e008-0b40-4293-8f3f-d8e89a79451c",
        "z": 3
      },
      {
        "position": {
          "x": -148,
          "y": 60
        },
        "size": {
          "width": 96,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "SR_BTN_RISE",
            "fontSize": 11
          }
        },
        "id": "56d70fd7-5cbf-4d47-bd62-83eaca376b43",
        "z": 5
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a9b7dcd7-a471-4627-8347-18abe38d2eea"
        },
        "target": {
          "id": "5a20e008-0b40-4293-8f3f-d8e89a79451c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "6.667%",
              "dy": "25%",
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
                "text": "EV_BTN_HOLD"
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
        "id": "f9adeef0-5209-4376-96c0-447257e1e1a8",
        "z": 9,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5a20e008-0b40-4293-8f3f-d8e89a79451c"
        },
        "target": {
          "id": "a9b7dcd7-a471-4627-8347-18abe38d2eea",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "98.333%",
              "dy": "68.333%",
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
                "text": "EV_BTN_FREE"
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
        "id": "b01e151e-9135-4df8-a5ed-faa386588989",
        "z": 10,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "56d70fd7-5cbf-4d47-bd62-83eaca376b43"
        },
        "target": {
          "id": "a9b7dcd7-a471-4627-8347-18abe38d2eea",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "53.333%",
              "dy": "100%",
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
                "text": "after 50ms"
              }
            },
            "position": {
              "distance": 0.524,
              "offset": -33.00000183105469,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
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
        "id": "0e2bfc40-0c4d-415c-8544-74b54007783e",
        "z": 14,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 139,
          "y": 57
        },
        "size": {
          "width": 97,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_DOWN",
            "fontSize": 11
          },
          "specification": {
            "text": "entry / raise EV_SYS_ON"
          }
        },
        "id": "996919cf-e5cb-4415-90ee-4b388a51d43a",
        "z": 16
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "56d70fd7-5cbf-4d47-bd62-83eaca376b43"
        },
        "target": {
          "id": "996919cf-e5cb-4415-90ee-4b388a51d43a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "6.667%",
              "dy": "40%",
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
                "text": "EV_BTN_HOLD"
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
        "id": "ced92b3e-e03c-4ede-b495-492fe8ca3a82",
        "z": 17,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "996919cf-e5cb-4415-90ee-4b388a51d43a"
        },
        "target": {
          "id": "56d70fd7-5cbf-4d47-bd62-83eaca376b43",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "91.667%",
              "dy": "73.333%",
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
                "text": "EV_BTN_FREE"
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
        "id": "4bac94b7-e589-4ae3-bb0a-61edb147c7b2",
        "z": 17,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "5a20e008-0b40-4293-8f3f-d8e89a79451c"
        },
        "target": {
          "id": "996919cf-e5cb-4415-90ee-4b388a51d43a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "50.515%",
              "dy": "18.333%",
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
                "text": "after 50ms"
              }
            },
            "position": {
              "distance": 0.48360655737704916,
              "offset": -35,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
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
        "id": "40faf2e2-a8ce-447d-a521-4011cae1999b",
        "z": 18,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -233,
          "y": -98
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "4841920c-43e1-4e89-8fa6-874adf3ab71d",
        "z": 19,
        "embeds": [
          "7d43b91e-187d-40af-9043-0eb46fdc7bfb"
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
          "x": -233,
          "y": -83
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "7d43b91e-187d-40af-9043-0eb46fdc7bfb",
        "z": 20,
        "parent": "4841920c-43e1-4e89-8fa6-874adf3ab71d"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "4841920c-43e1-4e89-8fa6-874adf3ab71d"
        },
        "target": {
          "id": "a9b7dcd7-a471-4627-8347-18abe38d2eea",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "6.667%",
              "dy": "58.333%",
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
        "id": "a0b58351-1e62-466f-9d97-bbb8fae7e0d1",
        "z": 21,
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
          "moduleName": "SensorStatechart",
          "statemachinePrefix": "sensorStatechart",
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