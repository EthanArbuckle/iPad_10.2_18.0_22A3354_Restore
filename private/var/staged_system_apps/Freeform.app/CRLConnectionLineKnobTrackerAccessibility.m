@implementation CRLConnectionLineKnobTrackerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLConnectionLineKnobTracker");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLCanvasKnobTrackerAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_class(CRLConnectionLineKnobTrackerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  int v20;
  BOOL v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  objc_super v56;
  char v57;

  y = a3.y;
  x = a3.x;
  v57 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineKnobTrackerAccessibility crlaxTarget](self, "crlaxTarget"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rep"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layout"));

  v10 = (objc_class *)objc_opt_class(CRLConnectionLineAbstractLayout, v9);
  v11 = __CRLAccessibilityCastAsClass(v10, (uint64_t)v8, 1, &v57);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (v57)
    goto LABEL_42;
  v13 = (void *)v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "connectedFrom"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "connectedTo"));
  v56.receiver = self;
  v56.super_class = (Class)CRLConnectionLineKnobTrackerAccessibility;
  -[CRLConnectionLineKnobTrackerAccessibility moveKnobToCanvasPosition:](&v56, "moveKnobToCanvasPosition:", x, y);
  if (v13)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "connectedFrom"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "connectedTo"));
    v18 = (void *)v17;
    if (v14)
      v19 = 1;
    else
      v19 = v16 == 0;
    v20 = !v19;
    if (v15)
      v21 = 1;
    else
      v21 = v17 == 0;
    v22 = !v21;
    if ((!v14 || (v23 = v14, v16)) && (!v15 || (v23 = v15, v17)))
    {
      if ((v20 | v22) != 1)
      {
        v48 = (void *)v17;
        v49 = v15;
        if (v15 == (void *)v17)
        {
          v48 = v16;
          v49 = v14;
          if (v14 == v16)
          {
            v27 = 0;
            v28 = 0;
            v29 = 0;
            goto LABEL_35;
          }
        }
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("Changed connection from %1$@ to %2$@"), 0, 0));

        v28 = v49;
        v29 = v48;
        if (!v27)
          goto LABEL_35;
LABEL_21:
        if (v28)
        {
          v55 = v29;
          v52 = v18;
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineKnobTrackerAccessibility crlaxTarget](self, "crlaxTarget"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "rep"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "interactiveCanvasController"));

          v57 = 0;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "info"));
          v53 = v32;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "repForInfo:", v33));

          v36 = (void *)objc_opt_class(CRLCanvasRepAccessibility, v35);
          v37 = __CRLAccessibilityCastAsSafeCategory(v36, (uint64_t)v34, 1, &v57);
          v54 = (void *)objc_claimAutoreleasedReturnValue(v37);
          if (!v57)
          {

            if (!v55)
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "crlaxDescriptionForConnections"));
              v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v44));
              goto LABEL_32;
            }
            v51 = v16;
            v57 = 0;
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "info"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "repForInfo:", v38));

            v41 = (void *)objc_opt_class(CRLCanvasRepAccessibility, v40);
            v42 = __CRLAccessibilityCastAsSafeCategory(v41, (uint64_t)v39, 1, &v57);
            v43 = objc_claimAutoreleasedReturnValue(v42);
            if (!v57)
            {
              v44 = (void *)v43;

              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "crlaxDescriptionForConnections"));
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "crlaxDescriptionForConnections"));
              v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v27, v45, v46));

              v16 = v51;
LABEL_32:

              if (objc_msgSend(v47, "length"))
                CRLAccessibilityPostAnnouncementNotification(self, v47);

              v18 = v52;
              v29 = v55;
              goto LABEL_35;
            }
          }
LABEL_42:
          abort();
        }
LABEL_35:

        goto LABEL_36;
      }
      if (v20)
        v23 = v16;
      else
        v23 = (void *)v17;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v24;
      v26 = CFSTR("Connected to %@");
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = v24;
      v26 = CFSTR("Disconnected from %@");
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", v26, 0, 0));

    v28 = v23;
    v29 = 0;
    if (!v27)
      goto LABEL_35;
    goto LABEL_21;
  }
LABEL_36:

}

- (BOOL)crlaxShouldAnnounceValueUponEndMovingKnob
{
  return 1;
}

@end
