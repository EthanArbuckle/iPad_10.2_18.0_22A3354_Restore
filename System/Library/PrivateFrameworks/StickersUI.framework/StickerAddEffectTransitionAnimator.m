@implementation StickerAddEffectTransitionAnimator

- (double)transitionScaleForView:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;
  double result;
  double v11;
  double v12;

  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (!v4)
    return 1.0;
  v5 = (void *)v4;
  v6 = (void *)objc_opt_self();
  v7 = a3;
  swift_retain();
  v8 = objc_msgSend(v5, sel_effect);
  v9 = (unint64_t)objc_msgSend(v8, sel_type);

  if ((v9 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(v5, sel_bounds);
    objc_msgSend(v6, sel_extraScaleToIncludeStrokeWithEffectType_bounds_, v9);
    v12 = v11;
    swift_release();

    return v12;
  }
  return result;
}

- (CGRect)frameIncludingStrokeForView:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  double (*v7)(uint64_t);
  id v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  objc_opt_self();
  v5 = swift_dynamicCastObjCClass();
  if (v5)
  {
    v6 = v5;
    v7 = (double (*)(uint64_t))*((_QWORD *)self->super.isa + 58);
    v8 = a3;
    swift_retain();
    v9 = v7(v6);
    objc_msgSend(v8, sel_frame);
    v14 = sub_247A73BE4(v10, v11, v12, v13);
    v16 = v15;
    objc_msgSend(v8, sel_frame);
    v18 = sub_247A73BCC(v14, v16, v9 * v17);
    v20 = v19;
    v22 = v21;
    v24 = v23;

    swift_release();
  }
  else
  {
    objc_msgSend(a3, sel_frame);
    v18 = v25;
    v20 = v26;
    v22 = v27;
    v24 = v28;
  }
  v29 = v18;
  v30 = v20;
  v31 = v22;
  v32 = v24;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

@end
