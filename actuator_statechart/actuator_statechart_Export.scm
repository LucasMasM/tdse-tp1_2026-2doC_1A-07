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
            "text": "actuator_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\ninterface:\n\tin event EV_ACT_BARON\n\tin event EV_ACT_BAROFF\n\t\n\t\n\t"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -155,
          "y": -108
        },
        "size": {
          "width": 84,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_OFF",
            "fontSize": 11
          }
        },
        "id": "064359e7-ad53-4720-b0ff-c9d6faae36f5",
        "z": 2
      },
      {
        "position": {
          "x": 78,
          "y": -105
        },
        "size": {
          "width": 85,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_TITR",
            "fontSize": 11
          }
        },
        "id": "cecf5848-764e-4377-9e1b-2ee1fbdabd28",
        "z": 6
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "064359e7-ad53-4720-b0ff-c9d6faae36f5"
        },
        "target": {
          "id": "cecf5848-764e-4377-9e1b-2ee1fbdabd28",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "6.316%",
              "dy": "56.098%",
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
                "text": "EV_ACT_BARON"
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
        "id": "0e0010bd-ee00-456d-bb83-1ff832854a4c",
        "z": 9,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -158,
          "y": 46
        },
        "size": {
          "width": 85,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_TITL",
            "fontSize": 11
          }
        },
        "id": "65d4caaf-bfe6-4006-bfbf-8e6c95cdf3d5",
        "z": 19
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "65d4caaf-bfe6-4006-bfbf-8e6c95cdf3d5"
        },
        "target": {
          "id": "064359e7-ad53-4720-b0ff-c9d6faae36f5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "47.872%",
              "dy": "95.122%",
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
                "text": "after 3s"
              }
            },
            "position": {
              "distance": 0.4885057471264368,
              "offset": -40,
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
        "id": "a0286a9a-7094-4749-bff0-6858cd81eaca",
        "z": 20,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": 84,
          "y": 47
        },
        "size": {
          "width": 79,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_ON",
            "fontSize": 11
          }
        },
        "id": "90c9d509-bffd-4e35-b790-95675a79a7d4",
        "z": 21
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "cecf5848-764e-4377-9e1b-2ee1fbdabd28"
        },
        "target": {
          "id": "90c9d509-bffd-4e35-b790-95675a79a7d4",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "49.451%",
              "dy": "18.519%",
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
                "text": "after 3s"
              }
            },
            "position": {
              "distance": 0.5116279069767442,
              "offset": -30,
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
        "id": "5007810a-774c-4d81-8059-305c35e02343",
        "z": 22,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "90c9d509-bffd-4e35-b790-95675a79a7d4"
        },
        "target": {
          "id": "65d4caaf-bfe6-4006-bfbf-8e6c95cdf3d5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "94.681%",
              "dy": "55.556%",
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
                "text": "EV_ACT_BAROFF"
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
        "id": "20b0a29a-13f1-49f3-89f0-de283dce93cd",
        "z": 22,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -219,
          "y": -86
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "0675bcda-5ce0-424a-9435-188248a69a7c",
        "z": 23,
        "embeds": [
          "1a548a44-778d-4c14-a9b6-5a756d66edaf"
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
          "x": -219,
          "y": -71
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "1a548a44-778d-4c14-a9b6-5a756d66edaf",
        "z": 24,
        "parent": "0675bcda-5ce0-424a-9435-188248a69a7c"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0675bcda-5ce0-424a-9435-188248a69a7c"
        },
        "target": {
          "id": "064359e7-ad53-4720-b0ff-c9d6faae36f5",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "8.511%",
              "dy": "50%",
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
        "id": "7aa3cafd-6f97-4dd9-9843-acf295f255fb",
        "z": 25,
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
          "moduleName": "ActuatorStatechart",
          "statemachinePrefix": "actuatorStatechart",
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