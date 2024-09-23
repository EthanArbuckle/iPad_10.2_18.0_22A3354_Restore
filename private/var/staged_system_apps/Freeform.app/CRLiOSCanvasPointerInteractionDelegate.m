@implementation CRLiOSCanvasPointerInteractionDelegate

- (CRLiOSCanvasPointerInteractionDelegate)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLiOSCanvasPointerInteractionDelegate *v5;
  CRLiOSCanvasPointerInteractionDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSCanvasPointerInteractionDelegate;
  v5 = -[CRLiOSCanvasPointerInteractionDelegate init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_icc, v4);

  return v6;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CRLiOSCursorUpdatingSource *lastCursorUpdatingSource;
  void **p_lastCursorUpdatingSource;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  CRLCursor *v34;
  CRLCursor *v35;
  id v36;
  CRLiOSCursorUpdatingSource *v37;
  id v38;
  void *v39;
  id v40;
  __objc2_class *v41;
  uint64_t v42;
  void *v43;
  id v44;
  CRLiOSCursorUpdatingSource *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  CRLiOSCursorUpdatingSource *v53;
  CRLiOSCursorUpdatingSource *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  uint64_t v63;
  char **v64;
  void *v65;
  char *v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  CRLiOSCursorUpdatingSource *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  CRLiOSCursorUpdatingSource *v87;
  CRLiOSCursorUpdatingSource *v88;
  void *v89;
  void *v90;
  CRLCursor **p_lastCursor;
  CRLCursor *v92;
  void *v93;
  void *v94;
  CRLCursor *lastCursor;
  CRLCursor *v97;
  id v98;
  CRLiOSCursorUpdatingSource *v99;
  void *v100;
  void *v101;
  int v102;
  NSObject *v103;
  void *v104;
  void *v105;
  void *v106;
  CRLiOSCursorUpdatingSource *v107;
  id v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  id v119;
  _BYTE v120[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asiOSCVC"));

  objc_msgSend(v9, "location");
  if ((objc_msgSend(v13, "i_allowCanvasInteraction:atPoint:", v8) & 1) != 0)
  {
    v114 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCursorPlatformObject cursorPlatformObjectWithPointerRegionRequest:](CRLCursorPlatformObject, "cursorPlatformObjectWithPointerRegionRequest:", v9));
    v14 = objc_loadWeakRetained((id *)&self->_icc);
    objc_msgSend(v9, "location");
    objc_msgSend(v14, "convertBoundsToUnscaledPoint:");
    v16 = v15;
    v18 = v17;

    if ((objc_msgSend(v13, "currentlyTrackingIndirectPointerTouch") & 1) != 0)
    {
      if (self->_lastCursor)
      {
        p_lastCursorUpdatingSource = (void **)&self->_lastCursorUpdatingSource;
        lastCursorUpdatingSource = self->_lastCursorUpdatingSource;
        if (lastCursorUpdatingSource
          && -[CRLiOSCursorUpdatingSource wantsOpportunityToUpdateCursorDuringDrag](lastCursorUpdatingSource, "wantsOpportunityToUpdateCursorDuringDrag"))
        {
          v110 = v13;
          v22 = objc_opt_class(CRLCanvasRep, v21);
          v23 = sub_100221D0C(v22, *p_lastCursorUpdatingSource);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          v31 = sub_100221DDC(*p_lastCursorUpdatingSource, 1, v25, v26, v27, v28, v29, v30, (uint64_t)&OBJC_PROTOCOL___CRLEditor);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          v33 = v32;
          if (v24)
          {
            objc_msgSend(v24, "convertNaturalPointFromUnscaledCanvas:", v16, v18);
            v34 = (CRLCursor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "cursorAtPoint:forKnob:withCursorPlatformObject:", 0, v114));
          }
          else
          {
            if (!v32)
            {
              v102 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101239968);
              v103 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100DFC7CC((uint64_t *)&self->_lastCursorUpdatingSource, v102, v103);
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101239988);
              v104 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100DE87A4(v104);
              v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasPointerInteractionDelegate pointerInteraction:regionForRequest:defaultRegion:]"));
              v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasPointerInteractionDelegate.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v105, v106, 126, 0, "Unexpected lastCursorUpdatingSource type! %@", *p_lastCursorUpdatingSource);

              goto LABEL_45;
            }
            v34 = (CRLCursor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "cursorAtPoint:withCursorPlatformObject:", v114, v16, v18));
          }
          lastCursor = self->_lastCursor;
          self->_lastCursor = v34;

LABEL_45:
          v97 = self->_lastCursor;
          if (v97)
          {
            v98 = v10;
            v99 = self->_lastCursorUpdatingSource;
            v100 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCursor identifierSuffix](v97, "identifierSuffix"));
            v107 = v99;
            v10 = v98;
            v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p-%@"), v107, v100));

            -[CRLCursor activeScaledRect](self->_lastCursor, "activeScaledRect");
            v36 = (id)objc_claimAutoreleasedReturnValue(+[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v101));

          }
          else
          {
            v36 = 0;
          }

          v13 = v110;
          goto LABEL_40;
        }
        v36 = v10;
        -[CRLCursor setConstrainedAxes:](self->_lastCursor, "setConstrainedAxes:", 0);
      }
      else
      {
        v36 = 0;
      }
LABEL_40:

      goto LABEL_41;
    }
    v37 = self->_lastCursorUpdatingSource;
    self->_lastCursorUpdatingSource = 0;

    v38 = objc_loadWeakRetained((id *)&self->_icc);
    v119 = 0;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "hitKnobAtPoint:inputType:returningRep:", 0, &v119, v16, v18));
    v40 = v119;

    v41 = &OBJC_METACLASS___CRLCanvasKnobAccessibilityElement;
    v112 = v39;
    v113 = v40;
    if (v39
      && (objc_msgSend(v40, "convertNaturalPointFromUnscaledCanvas:", v16, v18),
          (v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "cursorAtPoint:forKnob:withCursorPlatformObject:", v39, v114))) != 0))
    {
      v43 = (void *)v42;
      v44 = v39;
      v45 = v43;
      v52 = sub_100221DDC(v40, 1, v46, v47, v48, v49, v50, v51, (uint64_t)&OBJC_PROTOCOL___CRLiOSCursorUpdatingSource);
      v53 = (CRLiOSCursorUpdatingSource *)objc_claimAutoreleasedReturnValue(v52);
      v54 = self->_lastCursorUpdatingSource;
      self->_lastCursorUpdatingSource = v53;

      v55 = v45;
    }
    else
    {
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));
      if ((objc_opt_respondsToSelector(v56, "currentDocumentMode") & 1) != 0)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "currentDocumentMode"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "cursorAtPoint:withCursorPlatformObject:", v114, v16, v18));

        if (v55)
        {
          v44 = 0;
LABEL_33:
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&v41[11], "defaultCursor"));
          if (v55 == v89)
            v90 = 0;
          else
            v90 = v55;
          p_lastCursor = &self->_lastCursor;
          objc_storeStrong((id *)&self->_lastCursor, v90);

          v92 = self->_lastCursor;
          if (v92)
          {
            v93 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCursor identifierSuffix](v92, "identifierSuffix"));
            v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p-%@"), v44, v93));

            -[CRLCursor activeScaledRect](*p_lastCursor, "activeScaledRect");
            v36 = (id)objc_claimAutoreleasedReturnValue(+[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v94));

          }
          else
          {
            v36 = 0;
          }

          goto LABEL_40;
        }
      }
      else
      {

      }
      v109 = v8;
      v111 = v13;
      v108 = v10;
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      v58 = objc_loadWeakRetained((id *)&self->_icc);
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "editorController"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "currentEditors"));
      v45 = (CRLiOSCursorUpdatingSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "reverseObjectEnumerator"));

      v61 = -[CRLiOSCursorUpdatingSource countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v115, v120, 16);
      if (v61)
      {
        v62 = v61;
        v63 = *(_QWORD *)v116;
        v64 = &selRef_crlwp_characterSetWithCharactersInArray_length_;
        while (2)
        {
          v65 = 0;
          v66 = v64[98];
          do
          {
            if (*(_QWORD *)v116 != v63)
              objc_enumerationMutation(v45);
            v67 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)v65);
            if ((objc_opt_respondsToSelector(v67, v66) & 1) != 0)
            {
              v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "cursorAtPoint:withCursorPlatformObject:", v114, v16, v18));
              if (v68)
              {
                v55 = (void *)v68;
                v44 = v67;
                v86 = sub_100221DDC(v44, 1, v80, v81, v82, v83, v84, v85, (uint64_t)&OBJC_PROTOCOL___CRLiOSCursorUpdatingSource);
                v87 = (CRLiOSCursorUpdatingSource *)objc_claimAutoreleasedReturnValue(v86);
                v88 = self->_lastCursorUpdatingSource;
                self->_lastCursorUpdatingSource = v87;

                v10 = v108;
                v8 = v109;
                v13 = v111;
                goto LABEL_31;
              }
            }
            v65 = (char *)v65 + 1;
          }
          while (v62 != v65);
          v62 = -[CRLiOSCursorUpdatingSource countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v115, v120, 16);
          v64 = &selRef_crlwp_characterSetWithCharactersInArray_length_;
          if (v62)
            continue;
          break;
        }
      }

      v69 = objc_loadWeakRetained((id *)&self->_icc);
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "hitRep:withPrecision:", 1, v16, v18));

      objc_msgSend(v70, "convertNaturalPointFromUnscaledCanvas:", v16, v18);
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "cursorAtPoint:forKnob:withCursorPlatformObject:", 0, v114));
      if (!v55)
      {
        v44 = 0;
        v113 = v70;
        v10 = v108;
        v8 = v109;
        v13 = v111;
        goto LABEL_32;
      }
      v41 = &OBJC_METACLASS___CRLCanvasKnobAccessibilityElement;
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCursor defaultCursor](CRLCursor, "defaultCursor"));

      v10 = v108;
      v8 = v109;
      v13 = v111;
      if (v55 == v71)
      {
        v44 = 0;
        v113 = v70;
        goto LABEL_33;
      }
      v44 = v70;
      v78 = sub_100221DDC(v44, 1, v72, v73, v74, v75, v76, v77, (uint64_t)&OBJC_PROTOCOL___CRLiOSCursorUpdatingSource);
      v79 = (CRLiOSCursorUpdatingSource *)objc_claimAutoreleasedReturnValue(v78);
      v45 = self->_lastCursorUpdatingSource;
      self->_lastCursorUpdatingSource = v79;
      v113 = v44;
    }
LABEL_31:

LABEL_32:
    v41 = &OBJC_METACLASS___CRLCanvasKnobAccessibilityElement;
    goto LABEL_33;
  }
  v35 = self->_lastCursor;
  self->_lastCursor = 0;

  v36 = 0;
LABEL_41:

  return v36;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCursor effect](self->_lastCursor, "effect", a3, a4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCursor effect](self->_lastCursor, "effect"));
    v7 = objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithEffect:shape:](UIPointerStyle, "styleWithEffect:shape:", v6, 0));
LABEL_5:
    v9 = (void *)v7;

    return v9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCursor shape](self->_lastCursor, "shape"));

  if (v8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCursor shape](self->_lastCursor, "shape"));
    v7 = objc_claimAutoreleasedReturnValue(+[UIPointerStyle styleWithShape:constrainedAxes:](UIPointerStyle, "styleWithShape:constrainedAxes:", v6, -[CRLCursor constrainedAxes](self->_lastCursor, "constrainedAxes")));
    goto LABEL_5;
  }
  v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012399A8);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DFC888(v11, v12);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012399C8);
  v13 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE87A4(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasPointerInteractionDelegate pointerInteraction:styleForRegion:]"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasPointerInteractionDelegate.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 152, 0, "Invalid cursor without any data!");

  v9 = 0;
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCursorUpdatingSource, 0);
  objc_storeStrong((id *)&self->_lastCursor, 0);
  objc_destroyWeak((id *)&self->_icc);
}

@end
