@implementation UIKBFloatingKeyplaneTransformation

+ (id)transformationIdentifier
{
  return CFSTR("flt");
}

+ (id)transformKeyplane:(id)a3 withTransformationContext:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "visualStyling") & 0xFF0000) == 0x90000)
  {
    +[UIKeyboardPopoverContainer contentInsets](UIKeyboardPopoverContainer, "contentInsets");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "screenTraits");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    v14 = v13;

    objc_msgSend(v5, "firstCachedKeyWithName:", CFSTR("Handwriting-Input"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = -v8;
    if (v15)
    {
      v28[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insetKeys:withInsets:scale:", v18, 0.0, v17, -7.0, -v10, v14);

    }
    objc_msgSend(v5, "firstCachedKeyWithName:", CFSTR("Candidate-Selection"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
    {
      v27 = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insetKeys:withInsets:scale:", v21, 0.0, v17, 0.0, -v10, v14);

    }
    objc_msgSend(v5, "firstCachedKeyWithName:", CFSTR("Delete-Key"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v22)
    {
      v26 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "repositionKeys:withOffset:scale:", v24, v10, 0.0, v14);

    }
  }

  return v5;
}

@end
