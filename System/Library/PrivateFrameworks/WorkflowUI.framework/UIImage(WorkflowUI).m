@implementation UIImage(WorkflowUI)

- (id)wf_insetImageWithInsets:()WorkflowUI
{
  double v10;
  double v11;
  double v12;
  CGContext *CurrentContext;
  void *v14;
  void *v15;
  CGSize v17;

  objc_msgSend(a1, "size");
  v11 = v10;
  objc_msgSend(a1, "size");
  v17.width = a5 + a3 + v11;
  v17.height = a4 + a2 + v12;
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  objc_msgSend(a1, "drawAtPoint:", a3, a2);
  UIGraphicsPopContext();
  UIGraphicsGetImageFromCurrentImageContext();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "imageWithRenderingMode:", objc_msgSend(a1, "renderingMode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  return v15;
}

+ (id)wf_workflowUIImageNamed:()WorkflowUI
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
