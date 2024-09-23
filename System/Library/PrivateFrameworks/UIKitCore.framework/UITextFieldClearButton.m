@implementation UITextFieldClearButton

id __56___UITextFieldClearButton_setPointerInteractionEnabled___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  UITargetedPreview *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  UITargetedPreview *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  CGRect v46;

  v4 = a3;
  v5 = a2;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v5, "imageView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "image");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_contentInsets");
  v18 = v8 + v17;
  v20 = v10 + v19;
  v22 = v12 - (v17 + v21);
  v24 = v14 - (v19 + v23);

  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v18, v20, v22, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShadowPath:", v25);

  v26 = [UITargetedPreview alloc];
  objc_msgSend(v4, "preview");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preview");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "target");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[UITargetedPreview initWithView:parameters:target:](v26, "initWithView:parameters:target:", v28, v6, v30);

  +[UIPointerEffect effectWithPreview:](UIPointerLiftEffect, "effectWithPreview:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITargetedPreview target](v31, "target");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "container");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:toView:", v34, v18, v20, v22, v24);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;

  v46.origin.x = v36;
  v46.origin.y = v38;
  v46.size.width = v40;
  v46.size.height = v42;
  +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v36, v38, v40, v42, CGRectGetHeight(v46) * 0.5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v32, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

@end
