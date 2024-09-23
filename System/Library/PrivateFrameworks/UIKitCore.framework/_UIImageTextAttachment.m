@implementation _UIImageTextAttachment

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  void *v7;
  double *v8;
  double y;
  double v10;
  CGFloat width;
  double v12;
  CGFloat height;
  double v14;
  CGFloat x;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    x = self->_bounds.origin.x;
    y = self->_bounds.origin.y;
    width = self->_bounds.size.width;
    height = self->_bounds.size.height;
  }
  else
  {
    -[_UIImageTextAttachment _imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:](self, "_imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:", 0, a3, a5, 1, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a7.x, a7.y);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (double *)MEMORY[0x1E0C9D538];
    y = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v7, "size");
    width = v10;
    height = v12;
    if (objc_msgSend(v7, "hasBaseline"))
    {
      objc_msgSend(v7, "baselineOffsetFromBottom");
      y = y - v14;
    }
    x = *v8;

  }
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_imageAdaptedForTextAtIndex:(int64_t)a3 withAttributes:(id)a4 inContainer:(id)a5 sizeOnly:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void (**v30)(void *, void *);
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void (**v57)(void *, void *);
  void *v58;
  void (**v59)(void *, void *);
  uint64_t v61;
  void (**v62)(void *, void *);
  id v63;
  void *v64;
  BOOL v65;
  void *v66;
  _QWORD aBlock[4];
  id v68;
  id v69;
  _UIImageTextAttachment *v70;
  id v71;
  int64_t v72;
  _QWORD v73[4];
  id v74;
  const __CFString *v75;
  _QWORD v76[3];

  v76[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  -[_UIImageTextAttachment image](self, "image");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textLayoutManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = MEMORY[0x1E0C809B0];
  if (v13)
  {
    v73[0] = MEMORY[0x1E0C809B0];
    v73[1] = 3221225472;
    v73[2] = __90___UIImageTextAttachment__imageAdaptedForTextAtIndex_withAttributes_inContainer_sizeOnly___block_invoke;
    v73[3] = &unk_1E16E5EC8;
    v74 = v13;
    __90___UIImageTextAttachment__imageAdaptedForTextAtIndex_withAttributes_inContainer_sizeOnly___block_invoke((uint64_t)v73);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = v16;
      objc_msgSend(v16, "textStorage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
        goto LABEL_7;
    }
    else
    {

    }
  }
  objc_msgSend(v11, "layoutManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "textStorage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  if (objc_msgSend(v12, "_isSymbolImage"))
  {
    v20 = *(_QWORD *)off_1E1678D90;
    if (v10)
      objc_msgSend(v10, "objectForKeyedSubscript:", v20);
    else
      -[_UIImageTextAttachment _deriveAttribute:inStorage:atIndex:](self, "_deriveAttribute:inStorage:atIndex:", v20, v18, a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      +[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v21);
      v65 = a6;
      v22 = a3;
      v23 = v11;
      v24 = v18;
      v25 = v14;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIImageConfiguration _completeConfiguration:fromConfiguration:]((uint64_t)UIImageConfiguration, v26, 0);
      v27 = v10;
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "imageByApplyingSymbolConfiguration:", v28);
      v29 = objc_claimAutoreleasedReturnValue();

      v10 = v27;
      v12 = (id)v29;
      v15 = MEMORY[0x1E0C809B0];
      v14 = v25;
      v18 = v24;
      v11 = v23;
      a3 = v22;
      a6 = v65;
    }

  }
  if (!a6)
  {
    aBlock[0] = v15;
    aBlock[1] = 3221225472;
    aBlock[2] = __90___UIImageTextAttachment__imageAdaptedForTextAtIndex_withAttributes_inContainer_sizeOnly___block_invoke_6;
    aBlock[3] = &unk_1E16E5EF0;
    v12 = v12;
    v68 = v12;
    v69 = v10;
    v70 = self;
    v66 = v18;
    v71 = v18;
    v72 = a3;
    v30 = (void (**)(void *, void *))_Block_copy(aBlock);
    objc_msgSend(v12, "symbolConfiguration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_automaticSymbolConfiguration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    v34 = v14;
    if (v32)
    {
      v35 = v32;
    }
    else
    {
      +[UIImageSymbolConfiguration unspecifiedConfiguration](UIImageSymbolConfiguration, "unspecifiedConfiguration");
      v35 = (id)objc_claimAutoreleasedReturnValue();
    }
    v36 = v35;

    v64 = v36;
    objc_msgSend(v36, "configurationByApplyingConfiguration:", v31);
    v37 = (_QWORD *)objc_claimAutoreleasedReturnValue();

    v38 = objc_msgSend(v12, "_effectiveRenderingModeWithSymbolConfiguration:", v37);
    if (objc_msgSend(v12, "_isMultiColorSymbolImage"))
    {
      if (v38 != 1)
      {
        if (v38 != 2)
          goto LABEL_27;
        if (!objc_msgSend(v37, "_prefersMulticolor"))
          goto LABEL_25;
      }
      objc_msgSend(v11, "textView");
      v39 = v10;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "tintColor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2](v30, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v39;
      if (v42)
      {
        v75 = CFSTR("tintColor");
        v76[0] = v42;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[UIImageSymbolConfiguration _configurationWithNamedColorStyles:](UIImageSymbolConfiguration, "_configurationWithNamedColorStyles:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "configuration");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "configurationByApplyingConfiguration:", v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "imageWithConfiguration:", v46);
        v61 = objc_claimAutoreleasedReturnValue();

        v10 = v39;
        v12 = (id)v61;
LABEL_40:

        goto LABEL_41;
      }
    }
    if (v38 == 2)
    {
LABEL_25:
      v63 = v10;
      if ((objc_msgSend(v12, "_isHierarchicalColorSymbolImage") & 1) != 0)
      {
        v14 = v34;
      }
      else
      {
        v14 = v34;
        if (!objc_msgSend(v12, "_isPaletteColorSymbolImage"))
          goto LABEL_38;
      }
      if (v37)
      {
        if (v37[7])
        {
          objc_msgSend(v11, "textView");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "tintColor");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v30[2](v30, v48);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            v62 = v30;
            v34 = v14;
            objc_msgSend(v37, "_colors");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = (void *)objc_msgSend(v49, "mutableCopy");

            if (objc_msgSend(v44, "count"))
            {
              v50 = 0;
              do
              {
                objc_msgSend(v44, "objectAtIndexedSubscript:", v50);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                +[UIColor tintColor](UIColor, "tintColor");
                v52 = (void *)objc_claimAutoreleasedReturnValue();

                if (v51 == v52)
                  objc_msgSend(v44, "setObject:atIndexedSubscript:", v42, v50);
                ++v50;
              }
              while (v50 < objc_msgSend(v44, "count"));
            }
            objc_msgSend(v37, "_configurationByReplacingColors:", v44);
            v53 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "imageWithConfiguration:", v53);
            v54 = objc_claimAutoreleasedReturnValue();

            v37 = (_QWORD *)v53;
            v12 = (id)v54;
            v30 = v62;
            v10 = v63;
            goto LABEL_40;
          }
        }
      }
LABEL_38:
      objc_msgSend(v11, "textView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "tintColor");
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = v30;
      v58 = (void *)v56;
      v59 = v57;
      v57[2](v57, (void *)v56);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v42)
      {
        v10 = v63;
        v30 = v59;
        goto LABEL_42;
      }
      v34 = v14;
      objc_msgSend(v12, "imageWithTintColor:renderingMode:", v42, 1);
      v44 = v12;
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v63;
      v30 = v59;
      goto LABEL_40;
    }
LABEL_27:
    v42 = 0;
LABEL_41:
    v14 = v34;
LABEL_42:

    v18 = v66;
  }

  return v12;
}

- (id)imageForBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6
{
  return -[_UIImageTextAttachment _imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:](self, "_imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:", 0, a4, a6, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_initWithImage:(id)a3
{
  id v4;
  _UIImageTextAttachment *v5;
  _UIImageTextAttachment *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIImageTextAttachment;
  v5 = -[_UIImageTextAttachment init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_UIImageTextAttachment setImage:](v5, "setImage:", v4);

  return v6;
}

- (void)setBounds:(CGRect)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_bounds = a3;
}

- (CGRect)attachmentBoundsForTextContainer:(id)a3 proposedLineFragment:(CGRect)a4 glyphPosition:(CGPoint)a5 characterIndex:(unint64_t)a6
{
  void *v6;
  double *v7;
  double y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  double v13;
  CGFloat x;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    x = self->_bounds.origin.x;
    y = self->_bounds.origin.y;
    width = self->_bounds.size.width;
    height = self->_bounds.size.height;
  }
  else
  {
    -[_UIImageTextAttachment _imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:](self, "_imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:", a6, 0, a3, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.x, a5.y);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (double *)MEMORY[0x1E0C9D538];
    y = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v6, "size");
    width = v9;
    height = v11;
    if (objc_msgSend(v6, "hasBaseline"))
    {
      objc_msgSend(v6, "baselineOffsetFromBottom");
      y = y - v13;
    }
    x = *v7;

  }
  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)imageForBounds:(CGRect)a3 textContainer:(id)a4 characterIndex:(unint64_t)a5
{
  return -[_UIImageTextAttachment _imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:](self, "_imageAdaptedForTextAtIndex:withAttributes:inContainer:sizeOnly:", a5, 0, a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)_deriveAttribute:(id)a3 inStorage:(id)a4 atIndex:(int64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "attribute:atIndex:effectiveRange:", v7, a5, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (a5 >= 2 && !v9)
  {
    objc_msgSend(v8, "attribute:atIndex:effectiveRange:", v7, a5 - 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!v10)
  {
    v11 = a5 + 1;
    if (v11 >= objc_msgSend(v8, "length"))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(v8, "attribute:atIndex:effectiveRange:", v7, v11, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10;
}

@end
