@implementation DRPDropletViewConfiguration(ButtonHinting)

+ (id)hardwareButtonHintForButton:()ButtonHinting stage:keylineStyle:rectEdge:buttonRect:canvasSize:
{
  void *v22;
  double MidY;
  double Height;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _OWORD v75[8];
  CGRect v76;
  CGRect v77;

  +[SBHardwareButtonHintPrototypeDomain rootSettings](SBHardwareButtonHintPrototypeDomain, "rootSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v76.origin.x = a1;
  v76.origin.y = a2;
  v76.size.width = a3;
  v76.size.height = a4;
  MidY = CGRectGetMidY(v76);
  v77.origin.x = a1;
  v77.origin.y = a2;
  v77.size.width = a3;
  v77.size.height = a4;
  Height = CGRectGetHeight(v77);
  v25 = 0.0;
  v26 = 0;
  switch(a9)
  {
    case 0:
    case 1:
    case 5:
    case 6:
    case 7:
    case 9:
    case 10:
      objc_msgSend(v22, "cameraCaptureDropletWidth", Height);
      v28 = v27;
      objc_msgSend(v22, "cameraCaptureDropletHeight");
      v30 = v29;
      if (a10 == 2)
      {
        objc_msgSend(v22, "cameraCaptureFlattenedCornerRadius");
        v32 = v40;
        objc_msgSend(v22, "cameraCaptureFlattenedProtrusionFromEdge");
        v34 = v41;
        objc_msgSend(v22, "cameraCaptureFlattenedDropletRadius");
      }
      else if (a10 == 1)
      {
        objc_msgSend(v22, "cameraCapturePresentedCornerRadius");
        v32 = v42;
        objc_msgSend(v22, "cameraCapturePresentedProtrusionFromEdge");
        v34 = v43;
        objc_msgSend(v22, "cameraCapturePresentedDropletRadius");
      }
      else
      {
        if (a10)
          goto LABEL_21;
        objc_msgSend(v22, "cameraCaptureInitialCornerRadius");
        v32 = v31;
        objc_msgSend(v22, "cameraCaptureInitialProtrusionFromEdge");
        v34 = v33;
        objc_msgSend(v22, "cameraCaptureInitialDropletRadius");
      }
      goto LABEL_28;
    case 2:
      objc_msgSend(v22, "lockDropletWidth", Height);
      v28 = v44;
      objc_msgSend(v22, "lockDropletHeight");
      v30 = v45;
      if (a10 == 2)
      {
        objc_msgSend(v22, "lockFlattenedCornerRadius");
        v32 = v56;
        objc_msgSend(v22, "lockFlattenedProtrusionFromEdge");
        v34 = v57;
        objc_msgSend(v22, "lockFlattenedDropletRadius");
      }
      else if (a10 == 1)
      {
        objc_msgSend(v22, "lockPresentedCornerRadius");
        v32 = v58;
        objc_msgSend(v22, "lockPresentedProtrusionFromEdge");
        v34 = v59;
        objc_msgSend(v22, "lockPresentedDropletRadius");
      }
      else
      {
        if (a10)
          goto LABEL_21;
        objc_msgSend(v22, "lockInitialCornerRadius");
        v32 = v46;
        objc_msgSend(v22, "lockInitialProtrusionFromEdge");
        v34 = v47;
        objc_msgSend(v22, "lockInitialDropletRadius");
      }
      goto LABEL_28;
    case 3:
    case 4:
      objc_msgSend(v22, "volumeDropletWidth", Height);
      v28 = v36;
      objc_msgSend(v22, "volumeDropletHeight");
      v30 = v37;
      if (a10 == 2)
      {
        objc_msgSend(v22, "volumeFlattenedCornerRadius");
        v32 = v52;
        objc_msgSend(v22, "volumeFlattenedProtrusionFromEdge");
        v34 = v53;
        objc_msgSend(v22, "volumeFlattenedDropletRadius");
      }
      else if (a10 == 1)
      {
        objc_msgSend(v22, "volumePresentedCornerRadius");
        v32 = v54;
        objc_msgSend(v22, "volumePresentedProtrusionFromEdge");
        v34 = v55;
        objc_msgSend(v22, "volumePresentedDropletRadius");
      }
      else
      {
        if (a10)
          goto LABEL_21;
        objc_msgSend(v22, "volumeInitialCornerRadius");
        v32 = v38;
        objc_msgSend(v22, "volumeInitialProtrusionFromEdge");
        v34 = v39;
        objc_msgSend(v22, "volumeInitialDropletRadius");
      }
      goto LABEL_28;
    case 8:
      objc_msgSend(v22, "staccatoDropletWidth", Height);
      v28 = v48;
      objc_msgSend(v22, "staccatoDropletHeight");
      v30 = v49;
      if (a10 == 2)
      {
        objc_msgSend(v22, "staccatoFlattenedCornerRadius");
        v32 = v60;
        objc_msgSend(v22, "staccatoFlattenedProtrusionFromEdge");
        v34 = v61;
        objc_msgSend(v22, "staccatoFlattenedDropletRadius");
      }
      else if (a10 == 1)
      {
        objc_msgSend(v22, "staccatoPresentedCornerRadius");
        v32 = v62;
        objc_msgSend(v22, "staccatoPresentedProtrusionFromEdge");
        v34 = v63;
        objc_msgSend(v22, "staccatoPresentedDropletRadius");
      }
      else
      {
        if (a10)
        {
LABEL_21:
          v32 = 0.0;
          v34 = 0.0;
          goto LABEL_29;
        }
        objc_msgSend(v22, "staccatoInitialCornerRadius");
        v32 = v50;
        objc_msgSend(v22, "staccatoInitialProtrusionFromEdge");
        v34 = v51;
        objc_msgSend(v22, "staccatoInitialDropletRadius");
      }
LABEL_28:
      v25 = v35;
LABEL_29:
      v64 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      v75[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v75[5] = v64;
      v65 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      v75[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v75[7] = v65;
      v66 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      v75[0] = *MEMORY[0x1E0CD2610];
      v75[1] = v66;
      v67 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v75[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v75[3] = v67;
      objc_msgSend(MEMORY[0x1E0D1D8F0], "edgeAdaptiveKeylineWithCanvasSize:edge:protrusionFromEdge:centerAlongEdge:containerSize:containerCornerRadius:transform3D:dropletRadius:", a12, v75, a5, a6, v34, MidY, v28, v30, v32, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "keylineStyle");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "allButtonKeylineWidth");
      objc_msgSend(v68, "setOuterWidth:");

      if (a11 == 2 || a11 == 1 && a9 == 2)
      {
        if (a10)
        {
          objc_msgSend(v26, "changeToIntelligentLightStyle:preferAudioReactivity:canvasSize:", a11, 1, a5, a6);
          objc_msgSend(v22, "intelligentEdgeLightKeylineStyleBehaviorSettings");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setBehaviorSettingsForKeyPath:behaviorSettings:", CFSTR("keylineStyle"), v69);

        }
      }
      objc_msgSend(v22, "centerXBehaviorSettings");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBehaviorSettingsForKeyPath:behaviorSettings:", CFSTR("centerX"), v70);

      objc_msgSend(v22, "centerYBehaviorSettings");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBehaviorSettingsForKeyPath:behaviorSettings:", CFSTR("centerY"), v71);

      objc_msgSend(v22, "containerWidthBehaviorSettings");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBehaviorSettingsForKeyPath:behaviorSettings:", CFSTR("containerWidth"), v72);

      objc_msgSend(v22, "containerHeightBehaviorSettings");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBehaviorSettingsForKeyPath:behaviorSettings:", CFSTR("containerHeight"), v73);

LABEL_35:
      return v26;
    case 11:
      goto LABEL_35;
    default:
      v30 = Height;
      v28 = 0.0;
      goto LABEL_21;
  }
}

@end
