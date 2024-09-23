@implementation CRLUIButtonAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("UIButton");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLUIButtonAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)crlaxPreventPopoverAssociation
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415520);
}

- (void)crlaxSetPreventPopoverAssociation:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415520, a3);
}

- (id)crlaxAssociatedPopoverController
{
  return __CRLAccessibilityGetAssociatedWeakObject(self, &unk_101415521);
}

- (void)crlaxSetAssociatedPopoverController:(id)a3
{
  __CRLAccessibilitySetAssociatedWeakObject(self, &unk_101415521, (uint64_t)a3);
}

+ (id)crlaxAdditionalButtonLabelsPerImageFileName
{
  return 0;
}

+ (id)crlaxAddDocumentButtonLabel
{
  return 0;
}

- (id)__accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  double v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  __CFString *v78;
  void *v79;
  Class v80;
  char isKindOfClass;
  uint64_t v82;
  double v83;
  id v84;
  id v85;
  uint64_t v86;
  id v88;
  objc_super v89;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIButtonAccessibility imageForState:](self, "imageForState:", 0));
  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIButtonAccessibility backgroundImageForState:](self, "backgroundImageForState:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityLabel"));
  if (!objc_msgSend(v4, "length"))
  {
    if (!qword_101415528)
    {
      *(_QWORD *)&v7 = objc_opt_class(self, v5).n128_u64[0];
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxAdditionalButtonLabelsPerImageFileName", v7));
      v10 = objc_msgSend(v9, "mutableCopy");
      v11 = (void *)qword_101415528;
      qword_101415528 = (uint64_t)v10;

      v12 = (void *)qword_101415528;
      if (!qword_101415528)
      {
        v13 = objc_opt_new(NSMutableDictionary);
        v14 = (void *)qword_101415528;
        qword_101415528 = (uint64_t)v13;

        v12 = (void *)qword_101415528;
      }
      v15 = CRLAccessibilityLocalizedString(CFSTR("extras"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      objc_msgSend(v12, "setObject:forKey:", v16, CFSTR("CRL_NavigationBarExtrasIcon.png"));

      v17 = (void *)qword_101415528;
      v18 = CRLAccessibilityLocalizedString(CFSTR("preview.button"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      objc_msgSend(v17, "setObject:forKey:", v19, CFSTR("CRL_Preview_N.png"));

      v20 = (void *)qword_101415528;
      v21 = CRLAccessibilityLocalizedString(CFSTR("paragraph.align.justified"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      objc_msgSend(v20, "setObject:forKey:", v22, CFSTR("TSWP_align-H_justify_N.png"));

      v23 = (void *)qword_101415528;
      v24 = CRLAccessibilityLocalizedString(CFSTR("paragraph.align.left"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      objc_msgSend(v23, "setObject:forKey:", v25, CFSTR("TSWP_align-H_left_N.png"));

      v26 = (void *)qword_101415528;
      v27 = CRLAccessibilityLocalizedString(CFSTR("paragraph.align.center"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      objc_msgSend(v26, "setObject:forKey:", v28, CFSTR("TSWP_align-H_center_N.png"));

      v29 = (void *)qword_101415528;
      v30 = CRLAccessibilityLocalizedString(CFSTR("paragraph.align.right"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      objc_msgSend(v29, "setObject:forKey:", v31, CFSTR("TSWP_align-H_right_N.png"));

      v32 = (void *)qword_101415528;
      v33 = CRLAccessibilityLocalizedString(CFSTR("paragraph.align.natural"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      objc_msgSend(v32, "setObject:forKey:", v34, CFSTR("TSWP_align-H_natural_N.png"));

      v35 = (void *)qword_101415528;
      v36 = CRLAccessibilityLocalizedString(CFSTR("vertical.align.top"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      objc_msgSend(v35, "setObject:forKey:", v37, CFSTR("TSWP_align-V_top_N.png"));

      v38 = (void *)qword_101415528;
      v39 = CRLAccessibilityLocalizedString(CFSTR("vertical.align.middle"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
      objc_msgSend(v38, "setObject:forKey:", v40, CFSTR("TSWP_align-V_middle_N.png"));

      v41 = (void *)qword_101415528;
      v42 = CRLAccessibilityLocalizedString(CFSTR("vertical.align.bottom"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
      objc_msgSend(v41, "setObject:forKey:", v43, CFSTR("TSWP_align-V_bottom_N.png"));

      v44 = (void *)qword_101415528;
      v45 = CRLAccessibilityLocalizedString(CFSTR("bold"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
      objc_msgSend(v44, "setObject:forKey:", v46, CFSTR("sf_inspector_style_bold.png"));

      v47 = (void *)qword_101415528;
      v48 = CRLAccessibilityLocalizedString(CFSTR("italic"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      objc_msgSend(v47, "setObject:forKey:", v49, CFSTR("sf_inspector_style_italic.png"));

      v50 = (void *)qword_101415528;
      v51 = CRLAccessibilityLocalizedString(CFSTR("underline"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
      objc_msgSend(v50, "setObject:forKey:", v52, CFSTR("sf_inspector_style_underline.png"));

      v53 = (void *)qword_101415528;
      v54 = CRLAccessibilityLocalizedString(CFSTR("strikethrough"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      objc_msgSend(v53, "setObject:forKey:", v55, CFSTR("sf_inspector_style_strikethrough.png"));

      v56 = (void *)qword_101415528;
      v57 = CRLAccessibilityLocalizedString(CFSTR("gear.button"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
      objc_msgSend(v56, "setObject:forKey:", v58, CFSTR("CRL_GearIcon.png"));

      v59 = (void *)qword_101415528;
      v60 = CRLAccessibilityLocalizedString(CFSTR("delete.button"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
      objc_msgSend(v59, "setObject:forKey:", v61, CFSTR("DeleteGlyph.png"));

      v62 = (void *)qword_101415528;
      v63 = CRLAccessibilityLocalizedString(CFSTR("formula.input.key.delete"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
      objc_msgSend(v62, "setObject:forKey:", v64, CFSTR("Keyboard_glyph_delete-N"));

      v65 = (void *)qword_101415528;
      v66 = CRLAccessibilityLocalizedString(CFSTR("formula.input.key.functionbrowser"));
      v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
      objc_msgSend(v65, "setObject:forKey:", v67, CFSTR("Keyboard-Formula_glyph_fx-P"));

      v68 = (void *)qword_101415528;
      v69 = CRLAccessibilityLocalizedString(CFSTR("formula.input.key.operatortoggle"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
      objc_msgSend(v68, "setObject:forKey:", v70, CFSTR("Keyboard-Formula_glyph_formula2-P"));

      v71 = (void *)qword_101415528;
      v72 = CRLAccessibilityLocalizedString(CFSTR("formula.input.key.date.duration"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
      objc_msgSend(v71, "setObject:forKey:", v73, CFSTR("Keyboard-DateTime.png"));

    }
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityIdentifier"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "lastPathComponent"));

    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_101415528, "objectForKey:", v75));
    if (v6)
      goto LABEL_30;
    v76 = (void *)qword_101415528;
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "stringByAppendingPathExtension:", CFSTR("png")));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKey:", v77));

    if (v6)
      goto LABEL_30;
    if (objc_msgSend(v75, "hasPrefix:", CFSTR("CRL_Sync")))
    {
      v78 = CFSTR("sync.button");
    }
    else if (objc_msgSend(v75, "hasPrefix:", CFSTR("CRL_Duplicate")))
    {
      v78 = CFSTR("duplicate.button");
    }
    else if (objc_msgSend(v75, "hasPrefix:", CFSTR("CRL_Delete")))
    {
      v78 = CFSTR("delete.button");
    }
    else if (objc_msgSend(v75, "hasPrefix:", CFSTR("CRL_Action")))
    {
      v78 = CFSTR("action.button");
    }
    else if (objc_msgSend(v75, "hasPrefix:", CFSTR("CRL_New")))
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIButtonAccessibility superview](self, "superview"));
      v80 = NSClassFromString(CFSTR("CRLToolbar"));
      isKindOfClass = objc_opt_isKindOfClass(v79, v80);

      if ((isKindOfClass & 1) != 0)
      {
        *(_QWORD *)&v83 = objc_opt_class(self, v82).n128_u64[0];
        v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "crlaxAddDocumentButtonLabel", v83));
        if (v6)
          goto LABEL_30;
      }
      v78 = CFSTR("new.button");
    }
    else if (objc_msgSend(v75, "hasPrefix:", CFSTR("CRL_GearIcon")))
    {
      v78 = CFSTR("gear.button");
    }
    else
    {
      if ((objc_msgSend(v75, "hasPrefix:", CFSTR("kn_tb_icon_play")) & 1) == 0
        && !objc_msgSend(v75, "hasPrefix:", CFSTR("kn_tb_icon_extdisplay")))
      {
        v89.receiver = self;
        v89.super_class = (Class)CRLUIButtonAccessibility;
        v88 = -[CRLUIButtonAccessibility accessibilityLabel](&v89, "accessibilityLabel");
        v86 = objc_claimAutoreleasedReturnValue(v88);
        goto LABEL_29;
      }
      v78 = CFSTR("preview.animation");
    }
    v85 = CRLAccessibilityLocalizedString(v78);
    v86 = objc_claimAutoreleasedReturnValue(v85);
LABEL_29:
    v6 = (id)v86;
LABEL_30:

    goto LABEL_31;
  }
  v6 = v4;
LABEL_31:

  return v6;
}

@end
