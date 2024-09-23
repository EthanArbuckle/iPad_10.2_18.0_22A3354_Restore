@implementation _UISceneHostingSheetPresentationActionToHost

+ (id)actionForSheetGrabberDidTriggerPrimaryAction
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v3, "setObject:forSetting:", &unk_1E1A97308, 0);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v3, 0);

  return v4;
}

+ (id)actionForSheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  y = a5.y;
  x = a5.x;
  v7 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v10, "setObject:forSetting:", &unk_1E1A97320, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forSetting:", v11, 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forSetting:", v12, 2);

  *(CGFloat *)v16 = x;
  *(CGFloat *)&v16[1] = y;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v16, "{CGPoint=dd}");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forSetting:", v13, 3);

  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v10, 0);
  return v14;
}

+ (id)actionForSheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[2];

  v6 = a6;
  v7 = a5;
  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v13 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v13, "setObject:forSetting:", &unk_1E1A97338, 0);
  *(CGFloat *)v21 = v11;
  *(CGFloat *)&v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v21, "{CGPoint=dd}");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forSetting:", v14, 4);

  *(CGFloat *)v20 = x;
  *(CGFloat *)&v20[1] = y;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v20, "{CGPoint=dd}");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forSetting:", v15, 5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forSetting:", v16, 6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forSetting:", v17, 2);

  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v13, 0);
  return v18;
}

+ (id)actionForSheetInteractionDraggingDidEnd
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v3, "setObject:forSetting:", &unk_1E1A97350, 0);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v3, 0);

  return v4;
}

- (void)executeActionForSheetPresentationController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;

  v38 = a3;
  -[_UISceneHostingSheetPresentationActionToHost info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  switch(v6)
  {
    case 0:
      objc_msgSend(v38, "_remoteSheetGrabberDidTriggerPrimaryAction");
      break;
    case 1:
      -[_UISceneHostingSheetPresentationActionToHost info](self, "info");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForSetting:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v10 = v9;

      -[_UISceneHostingSheetPresentationActionToHost info](self, "info");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForSetting:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      -[_UISceneHostingSheetPresentationActionToHost info](self, "info");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForSetting:", 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "CGPointValue");
      v17 = v16;
      v19 = v18;

      objc_msgSend(v38, "_remoteSheetInteractionDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:", v13, v10, v17, v19);
      break;
    case 2:
      -[_UISceneHostingSheetPresentationActionToHost info](self, "info");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForSetting:", 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "CGPointValue");
      v23 = v22;
      v25 = v24;

      -[_UISceneHostingSheetPresentationActionToHost info](self, "info");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForSetting:", 5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "CGPointValue");
      v29 = v28;
      v31 = v30;

      -[_UISceneHostingSheetPresentationActionToHost info](self, "info");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForSetting:", 6);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "BOOLValue");

      -[_UISceneHostingSheetPresentationActionToHost info](self, "info");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForSetting:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "BOOLValue");

      objc_msgSend(v38, "_remoteSheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:", v34, v37, v23, v25, v29, v31);
      break;
    case 3:
      objc_msgSend(v38, "_remoteSheetInteractionDraggingDidEnd");
      break;
    default:
      break;
  }

}

@end
