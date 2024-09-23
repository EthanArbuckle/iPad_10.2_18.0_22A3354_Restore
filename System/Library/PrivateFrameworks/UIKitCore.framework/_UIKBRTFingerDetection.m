@implementation _UIKBRTFingerDetection

- (_UIKBRTFingerDetection)init
{
  _UIKBRTFingerDetection *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *touches;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKBRTFingerDetection;
  v2 = -[_UIKBRTFingerDetection init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    touches = v2->_touches;
    v2->_touches = v3;

  }
  return v2;
}

- (_UIKBRTFingerDetection)initWithParentView:(id)a3
{
  _UIKBRTFingerDetection *result;

  result = -[_UIKBRTFingerDetection init](self, "init");
  if (result)
    result->_feedbackParentView = (UIView *)a3;
  return result;
}

- (void)dealloc
{
  _UIKBRTFingerDetectionView *feedbackView;
  objc_super v4;

  -[UIView removeFromSuperview](self->_feedbackView, "removeFromSuperview");
  feedbackView = self->_feedbackView;
  self->_feedbackView = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UIKBRTFingerDetection;
  -[_UIKBRTFingerDetection dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  -[NSMutableDictionary removeAllObjects](self->_touches, "removeAllObjects");
  -[_UIKBRTFingerDetection _updateTouchInfoForFingerID:](self, "_updateTouchInfoForFingerID:", 0);
}

- (void)updateWithFCenter:(CGPoint)a3 jCenter:(CGPoint)a4 keySize:(CGSize)a5 rowOffsets:(id)a6 homeRowOffsetIndex:(int)a7
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIKBRTFingerDetection;
  -[_UIKBRTKeyboardTouchObserver updateWithFCenter:jCenter:keySize:rowOffsets:homeRowOffsetIndex:](&v8, sel_updateWithFCenter_jCenter_keySize_rowOffsets_homeRowOffsetIndex_, a6, *(_QWORD *)&a7, a3.x, a3.y, a4.x, a4.y, a5.width, a5.height);
  -[NSMutableDictionary removeAllObjects](self->_touches, "removeAllObjects");
  -[_UIKBRTFingerDetection _updateTouchInfoForFingerID:](self, "_updateTouchInfoForFingerID:", 0);
}

- (void)addTouchLocation:(CGPoint)a3 withRadius:(double)a4 withTouchTime:(double)a5 withIdentifier:(id)a6
{
  double y;
  double x;
  NSMutableDictionary *touches;
  id v13;
  void *v14;
  void *v15;
  _UIKBRTFingerInfo *v16;

  y = a3.y;
  x = a3.x;
  touches = self->_touches;
  v13 = a6;
  -[NSMutableDictionary objectForKey:](touches, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKBRTFingerDetection.m"), 224, CFSTR("Touch already in dictionary!"));

  }
  v16 = objc_alloc_init(_UIKBRTFingerInfo);
  -[_UIKBRTFingerInfo setLocation:](v16, "setLocation:", x, y);
  -[_UIKBRTFingerInfo setRadius:](v16, "setRadius:", a4);
  -[_UIKBRTFingerInfo setLastSeenTimestamp:](v16, "setLastSeenTimestamp:", a5);
  -[NSMutableDictionary setObject:forKey:](self->_touches, "setObject:forKey:", v16, v13);

  -[_UIKBRTFingerDetection _updateTouchInfoForFingerID:](self, "_updateTouchInfoForFingerID:", 0);
}

- (void)moveTouchWithIdentifier:(id)a3 toLocation:(CGPoint)a4 withRadius:(double)a5 atTouchTime:(double)a6
{
  double y;
  double x;
  void *v11;
  id v12;

  y = a4.y;
  x = a4.x;
  -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, "setLocation:", x, y);
    objc_msgSend(v12, "setRadius:", a5);
    objc_msgSend(v12, "setLastSeenTimestamp:", a6);
    -[_UIKBRTFingerDetection _updateTouchInfoForFingerID:](self, "_updateTouchInfoForFingerID:", objc_msgSend(v12, "identity"));
    v11 = v12;
  }

}

- (void)removeTouchWithIdentifier:(id)a3 touchCancelled:(BOOL)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  _UIKBRTFakeFingerInfo *v9;
  uint64_t v10;
  int *v11;
  id v12;

  v12 = a3;
  -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "identity");
    if ((unint64_t)-[NSMutableDictionary count](self->_touches, "count") < 4)
      goto LABEL_14;
    if (v7 != 9 && v7 != 6)
      goto LABEL_14;
    v9 = objc_alloc_init(_UIKBRTFakeFingerInfo);
    -[_UIKBRTFingerInfo setIdentity:](v9, "setIdentity:", v7);
    -[_UIKBRTFingerInfo setUnknownSeen:](v9, "setUnknownSeen:", 0);
    objc_msgSend(v6, "radius");
    -[_UIKBRTFingerInfo setRadius:](v9, "setRadius:");
    objc_msgSend(v6, "location");
    -[_UIKBRTFingerInfo setLocation:](v9, "setLocation:");
    v10 = objc_msgSend(v6, "identity");
    if (v10 == 6)
    {
      v11 = &OBJC_IVAR____UIKBRTFingerDetection__fakeLeftIndex;
    }
    else
    {
      if (v10 != 9)
      {
LABEL_13:

LABEL_14:
        -[NSMutableDictionary removeObjectForKey:](self->_touches, "removeObjectForKey:", v12);
        -[_UIKBRTFingerDetection _updateTouchInfoForFingerID:](self, "_updateTouchInfoForFingerID:", v7);
        goto LABEL_15;
      }
      v11 = &OBJC_IVAR____UIKBRTFingerDetection__fakeRightIndex;
    }
    objc_storeStrong((id *)((char *)&self->super.super.isa + *v11), v9);
    goto LABEL_13;
  }
LABEL_15:

}

- (unint64_t)fingerIdForTouchWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "identity");
  else
    v5 = 0;

  return v5;
}

- (id)touchIdentifiersForFingerId:(unint64_t)a3
{
  uint64_t v5;
  NSMutableDictionary *touches;
  id v7;
  NSMutableDictionary *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  unint64_t v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__140;
  v23 = __Block_byref_object_dispose__140;
  v24 = 0;
  v5 = MEMORY[0x1E0C809B0];
  if (a3 - 3 >= 0xA)
  {
    if (a3 >= 3)
    {
      v12 = 0;
      goto LABEL_5;
    }
  }
  else
  {
    touches = self->_touches;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __54___UIKBRTFingerDetection_touchIdentifiersForFingerId___block_invoke;
    v18[3] = &unk_1E16D8648;
    v18[4] = &v19;
    v18[5] = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](touches, "enumerateKeysAndObjectsUsingBlock:", v18);
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = self->_touches;
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __54___UIKBRTFingerDetection_touchIdentifiersForFingerId___block_invoke_2;
  v15[3] = &unk_1E16D8670;
  v17 = a3;
  v9 = v7;
  v16 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v15);
  v10 = (void *)v20[5];
  v20[5] = (uint64_t)v9;
  v11 = v9;

  v12 = (void *)v20[5];
LABEL_5:
  v13 = v12;
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (CGPoint)touchLocationForFingerId:(unint64_t)a3
{
  id v4;
  NSMutableDictionary *touches;
  int *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[6];
  uint64_t v15;
  id *location;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  CGPoint result;

  v4 = 0;
  v15 = 0;
  location = (id *)&v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__140;
  v19 = __Block_byref_object_dispose__140;
  v20 = 0;
  if (a3 - 3 <= 9)
  {
    touches = self->_touches;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51___UIKBRTFingerDetection_touchLocationForFingerId___block_invoke;
    v14[3] = &unk_1E16D8648;
    v14[4] = &v15;
    v14[5] = a3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](touches, "enumerateKeysAndObjectsUsingBlock:", v14);
    v4 = location[5];
    if (!v4)
    {
      if (a3 == 6)
      {
        v7 = &OBJC_IVAR____UIKBRTFingerDetection__fakeLeftIndex;
      }
      else
      {
        if (a3 != 9)
        {
          v4 = 0;
          goto LABEL_9;
        }
        v7 = &OBJC_IVAR____UIKBRTFingerDetection__fakeRightIndex;
      }
      objc_storeStrong(location + 5, *(id *)((char *)&self->super.super.isa + *v7));
      v4 = location[5];
    }
  }
LABEL_9:
  objc_msgSend(v4, "location");
  v9 = v8;
  v11 = v10;
  _Block_object_dispose(&v15, 8);

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (id)fingerIdsRelatedToTouchWithIdentifier:(id)a3 sinceTimestamp:(double)a4 includeThumbs:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  double v24;

  v5 = a5;
  -[NSMutableDictionary objectForKey:](self->_touches, "objectForKey:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "identity");
    v11 = 0;
    switch(v10)
    {
      case 0:
        break;
      case 1:
      case 3:
      case 4:
      case 5:
      case 6:
        if (v5)
          goto LABEL_10;
        v11 = &unk_1E1A942C8;
        goto LABEL_12;
      case 2:
      case 9:
      case 10:
      case 11:
      case 12:
        if (v5)
          goto LABEL_7;
        v11 = &unk_1E1A942E0;
        goto LABEL_12;
      case 7:
        if (!v5)
          goto LABEL_15;
LABEL_10:
        v12 = &unk_1E1A942C8;
        v13 = &unk_1E1A99120;
        goto LABEL_11;
      case 8:
        if (v5)
        {
LABEL_7:
          v12 = &unk_1E1A942E0;
          v13 = &unk_1E1A991B0;
LABEL_11:
          objc_msgSend(v12, "arrayByAddingObject:", v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
LABEL_15:
          v11 = 0;
        }
LABEL_12:
        -[NSMutableDictionary allValues](self->_touches, "allValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __93___UIKBRTFingerDetection_fingerIdsRelatedToTouchWithIdentifier_sinceTimestamp_includeThumbs___block_invoke;
        v21[3] = &unk_1E16D8698;
        v22 = v11;
        v23 = v10;
        v24 = a4;
        v15 = v11;
        objc_msgSend(v14, "indexesOfObjectsPassingTest:", v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectsAtIndexes:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v17, "valueForKey:", CFSTR("identity"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setWithArray:", v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        goto LABEL_12;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_linkTouchesInArray:(id)a3 withIndexes:(id)a4 opposingHandIndexes:(id)a5 unassignedIndexes:(id)a6 thumb:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v28;
  unint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  _QWORD v43[6];
  _QWORD v44[4];
  uint64_t v45;
  double *v46;
  uint64_t v47;
  uint64_t v48;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[_UIKBRTKeyboardTouchObserver keySize](self, "keySize");
  v18 = v17;
  if ((unint64_t)objc_msgSend(v13, "count") >= 2)
  {
    v45 = 0;
    v46 = (double *)&v45;
    v47 = 0x2020000000;
    v48 = 0;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v44[3] = 0;
    objc_msgSend(v13, "indexSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectsAtIndexes:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __102___UIKBRTFingerDetection__linkTouchesInArray_withIndexes_opposingHandIndexes_unassignedIndexes_thumb___block_invoke;
    v43[3] = &unk_1E16D86C0;
    v43[4] = &v45;
    v43[5] = v44;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v43);

    v21 = v46[3];
    v18 = v21 / (double)(unint64_t)(objc_msgSend(v13, "count") - 1);
    _Block_object_dispose(v44, 8);
    _Block_object_dispose(&v45, 8);
  }
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v13, "beginningIndex"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "location");
    v24 = v23;

  }
  else if (objc_msgSend(v15, "reversed"))
  {
    v24 = 0.0;
  }
  else
  {
    v24 = 1.79769313e308;
  }
  v25 = objc_msgSend(v15, "count");
  if (v25 + objc_msgSend(v14, "count"))
  {
    v28 = objc_msgSend(v15, "count");
    if (v28 + objc_msgSend(v14, "count"))
    {
      v29 = 0;
      v30 = v18 * 0.5;
      while ((unint64_t)objc_msgSend(v13, "count") <= 3)
      {
        if (objc_msgSend(v15, "count"))
        {
          v31 = objc_msgSend(v13, "count");
          v32 = objc_msgSend(v15, "endingIndex");
          if (v31)
          {
            objc_msgSend(v12, "objectAtIndex:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "location");
            v35 = v34;
            v36 = vabdd_f64(v24, v34);
            if (objc_msgSend(v13, "count") == 3)
              v37 = 2.0;
            else
              v37 = 1.0;
            if (vabdd_f64(v36, v18) > v30 * v37)
              goto LABEL_34;
            if (objc_msgSend(v13, "count") != 1)
            {
              v38 = v36 + v18 * (double)(unint64_t)(objc_msgSend(v13, "count") - 1);
              v36 = v38 / (double)(unint64_t)objc_msgSend(v13, "count");
            }
            objc_msgSend(v13, "addIndex:", objc_msgSend(v15, "endingIndex"));
            objc_msgSend(v15, "removeIndex:", objc_msgSend(v15, "endingIndex"));
            if (v16)
            {
LABEL_34:

              break;
            }
            v18 = v36;
          }
          else
          {
            objc_msgSend(v13, "addIndex:", v32);
            objc_msgSend(v15, "removeIndex:", objc_msgSend(v15, "endingIndex"));
            objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v13, "beginningIndex"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "location");
            v35 = v39;
          }

          v24 = v35;
        }
        if (objc_msgSend(v15, "count") || !objc_msgSend(v14, "count"))
        {
          if (!objc_msgSend(v15, "count"))
            break;
        }
        else
        {
          objc_msgSend(v15, "addIndex:", objc_msgSend(v14, "endingIndex"));
          objc_msgSend(v14, "removeIndex:", objc_msgSend(v14, "endingIndex"));
          ++v29;
          v30 = v30 * 0.75;
        }
        v40 = objc_msgSend(v15, "count");
        if (!(v40 + objc_msgSend(v14, "count")))
          break;
      }
    }
    else
    {
      v29 = 0;
    }
    v26 = objc_msgSend(v15, "count") < v29;
    if (objc_msgSend(v15, "count") && v29)
    {
      v41 = v29 - 1;
      do
      {
        v42 = v41;
        objc_msgSend(v14, "addIndex:", objc_msgSend(v15, "beginningIndex"));
        objc_msgSend(v15, "removeIndex:", objc_msgSend(v15, "beginningIndex"));
        if (!objc_msgSend(v15, "count"))
          break;
        v41 = v42 - 1;
      }
      while (v42);
    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)_updateTouchInfoFromOutsideInWithArray:(id)a3 indexes:(id)a4 newIdentityDict:(id)a5 fakeIndex:(id)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
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
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  _QWORD *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  _QWORD *v78;
  double v79;
  double v80;
  void *v81;
  double v82;
  id v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  _QWORD *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  id v105;
  uint64_t v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  id v113;
  id v114;
  id v115;
  id v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  id v123;
  id v124;
  _QWORD v125[4];
  id v126;
  id v127;
  id v128;
  id v129;
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[2];
  _QWORD v134[2];
  _QWORD v135[2];
  _QWORD v136[2];
  _QWORD v137[3];
  _QWORD v138[3];
  _QWORD v139[3];
  _QWORD v140[3];
  _QWORD v141[3];
  _QWORD v142[3];
  _QWORD v143[3];
  _QWORD v144[3];
  _QWORD v145[7];

  v145[5] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v124 = a6;
  v12 = objc_msgSend(v10, "reversed");
  if (v12)
    v13 = 2;
  else
    v13 = 1;
  if (v12)
    v14 = 12;
  else
    v14 = 3;
  if (v12)
    v15 = 11;
  else
    v15 = 4;
  v16 = 5;
  if (v12)
    v16 = 10;
  v121 = v16;
  v122 = v15;
  if (v12)
    v17 = 9;
  else
    v17 = 6;
  v18 = 7;
  if (v12)
    v18 = 8;
  v119 = v18;
  objc_msgSend(v10, "indexSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectsAtIndexes:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "reversed"))
  {
    objc_msgSend(v20, "reverseObjectEnumerator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allObjects");
    v22 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v22;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", &unk_1E1A991C8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexSet");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeIndexes:", v26);

  objc_msgSend(v10, "indexSet");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addIndexes:", v27);

  if ((unint64_t)objc_msgSend(v10, "count") >= 4)
  {
    v123 = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v118 = v20;
    v28 = v11;
    v29 = v24;
    v30 = objc_claimAutoreleasedReturnValue();
    v145[0] = v30;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v122);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v145[1] = v31;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v121);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v17;
    v34 = (void *)v32;
    v145[2] = v32;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v145[3] = v35;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v119);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v145[4] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = (void *)v30;
    v24 = v29;
    v11 = v28;
    v20 = v118;
    goto LABEL_60;
  }
  if (objc_msgSend(v10, "count") == 3)
  {
    v39 = v17;
    v123 = v9;
    objc_msgSend(v20, "objectAtIndex:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndex:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndex:", 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v24;
    if (v124 && (objc_msgSend(v124, "unknownSeen") & 1) == 0)
    {
      v57 = v40;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v144[0] = v35;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v122);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v144[1] = v59;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v121);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v144[2] = v60;
      v61 = v144;
    }
    else
    {
      objc_msgSend(v34, "location");
      v42 = v41;
      objc_msgSend(v40, "location");
      v44 = vabdd_f64(v42, v43);
      objc_msgSend(v31, "radius");
      v46 = v45;
      objc_msgSend(v34, "radius");
      v48 = (v46 + v47) * 0.5;
      objc_msgSend(v31, "location");
      v50 = v49;
      objc_msgSend(v40, "location");
      v52 = v50 - v51;
      objc_msgSend(v34, "location");
      v54 = v53;
      objc_msgSend(v40, "location");
      v56 = v52 / (v54 - v55);
      if (v44 <= v48 * 12.0)
      {
        if (v56 >= 0.35)
        {
          if (v56 <= 0.65 || (objc_msgSend(v34, "location"), v90 = v89, objc_msgSend(v31, "location"), v90 <= v91))
          {
            objc_msgSend(v34, "location");
            v93 = v92;
            objc_msgSend(v31, "location");
            v95 = v93 - v94;
            objc_msgSend(v31, "radius");
            if (v95 <= v96 * 5.0
              || (objc_msgSend(v34, "location"),
                  v98 = v97,
                  objc_msgSend(v31, "location"),
                  v100 = v98 - v99,
                  objc_msgSend(v31, "location"),
                  v102 = v101,
                  objc_msgSend(v40, "location"),
                  v100 <= (v102 - v103) * 1.5))
            {
              objc_msgSend(v40, "location");
              v108 = v107;
              objc_msgSend(v31, "location");
              if (v108 <= v109
                || (objc_msgSend(v40, "location"), v111 = v110, objc_msgSend(v34, "location"), v111 <= v112))
              {
                v57 = v40;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v122);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v137[0] = v35;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v121);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v137[1] = v59;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v137[2] = v60;
                v61 = v137;
              }
              else
              {
                v57 = v40;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v138[0] = v35;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v122);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v138[1] = v59;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v121);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v138[2] = v60;
                v61 = v138;
              }
            }
            else
            {
              v57 = v40;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v139[0] = v35;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v122);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v139[1] = v59;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v139[2] = v60;
              v61 = v139;
            }
          }
          else
          {
            v57 = v40;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v140[0] = v35;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v121);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v140[1] = v59;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v140[2] = v60;
            v61 = v140;
          }
        }
        else
        {
          v57 = v40;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v141[0] = v35;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v122);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v141[1] = v59;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v141[2] = v60;
          v61 = v141;
        }
      }
      else
      {
        v57 = v40;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
        v58 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)v58;
        if (v56 <= 0.5)
        {
          v143[0] = v58;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v122);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v143[1] = v59;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v143[2] = v60;
          v61 = v143;
        }
        else
        {
          v142[0] = v58;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v121);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v142[1] = v59;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v142[2] = v60;
          v61 = v142;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = v57;
    v24 = v117;
    goto LABEL_60;
  }
  if (objc_msgSend(v10, "count") == 2)
  {
    v120 = v17;
    objc_msgSend(v20, "objectAtIndex:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndex:", 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "radius");
    v64 = v63;
    objc_msgSend(v38, "radius");
    v66 = v64 + v65;
    objc_msgSend(v62, "location");
    v68 = v67;
    objc_msgSend(v38, "location");
    v70 = vabdd_f64(v68, v69) - v66;
    objc_msgSend(v38, "location");
    v72 = v71;
    objc_msgSend(v62, "location");
    v123 = v9;
    if (v72 <= v73)
    {
      objc_msgSend(v38, "location");
      v80 = v79;
      v81 = v62;
      objc_msgSend(v62, "location");
      v82 = v66 * 1.5;
      v83 = v11;
      if (v80 >= v84)
      {
        if (v70 >= v82)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v122);
          v85 = objc_claimAutoreleasedReturnValue();
          v131[0] = v85;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v120);
          v86 = objc_claimAutoreleasedReturnValue();
          v131[1] = v86;
          v87 = (void *)MEMORY[0x1E0C99D20];
          v88 = v131;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v121);
          v85 = objc_claimAutoreleasedReturnValue();
          v130[0] = v85;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v120);
          v86 = objc_claimAutoreleasedReturnValue();
          v130[1] = v86;
          v87 = (void *)MEMORY[0x1E0C99D20];
          v88 = v130;
        }
      }
      else if (v70 >= v82)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v122);
        v85 = objc_claimAutoreleasedReturnValue();
        v133[0] = v85;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v120);
        v86 = objc_claimAutoreleasedReturnValue();
        v133[1] = v86;
        v87 = (void *)MEMORY[0x1E0C99D20];
        v88 = v133;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v121);
        v85 = objc_claimAutoreleasedReturnValue();
        v132[0] = v85;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v120);
        v86 = objc_claimAutoreleasedReturnValue();
        v132[1] = v86;
        v87 = (void *)MEMORY[0x1E0C99D20];
        v88 = v132;
      }
      objc_msgSend(v87, "arrayWithObjects:count:", v88, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v81;
      v34 = (void *)v85;
      v11 = v83;
    }
    else
    {
      v74 = v62;
      if (v70 < v66 * 2.5)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
        v75 = objc_claimAutoreleasedReturnValue();
        v76 = (void *)v75;
        v31 = v62;
        if (v70 >= v66 * 1.5)
        {
          v135[0] = v75;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v121);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v135[1] = v35;
          v77 = (void *)MEMORY[0x1E0C99D20];
          v78 = v135;
        }
        else
        {
          v134[0] = v75;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v122);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v134[1] = v35;
          v77 = (void *)MEMORY[0x1E0C99D20];
          v78 = v134;
        }
        objc_msgSend(v77, "arrayWithObjects:count:", v78, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v76;
        goto LABEL_60;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
      v104 = v20;
      v105 = v11;
      v106 = objc_claimAutoreleasedReturnValue();
      v136[0] = v106;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v120);
      v86 = objc_claimAutoreleasedReturnValue();
      v136[1] = v86;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v136, 2);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v74;
      v34 = (void *)v106;
      v11 = v105;
      v20 = v104;
    }
    v35 = (void *)v86;
LABEL_60:

    v9 = v123;
    goto LABEL_61;
  }
  v37 = 0;
LABEL_61:
  v125[0] = MEMORY[0x1E0C809B0];
  v125[1] = 3221225472;
  v125[2] = __99___UIKBRTFingerDetection__updateTouchInfoFromOutsideInWithArray_indexes_newIdentityDict_fakeIndex___block_invoke;
  v125[3] = &unk_1E16D86E8;
  v126 = v37;
  v127 = v9;
  v128 = v11;
  v129 = v24;
  v113 = v24;
  v114 = v11;
  v115 = v9;
  v116 = v37;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v125);

}

- (void)_updateTouchInfoForFingerID:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  unint64_t v9;
  double v10;
  double v11;
  unint64_t v12;
  id v13;
  _UIKBRTFingerDetection *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  _UIKBRTFingerInfo *fakeLeftIndex;
  _UIKBRTFingerInfo *fakeRightIndex;
  _UIKBRTMutableOrderIndexSet *v47;
  _UIKBRTMutableOrderIndexSet *v48;
  id *v49;
  id *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  _UIKBRTMutableOrderIndexSet *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  uint64_t v63;
  _UIKBRTMutableOrderIndexSet *v64;
  _UIKBRTMutableOrderIndexSet *v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  char v76;
  int v77;
  int i;
  _UIKBRTFingerDetection *v79;
  void *v80;
  _UIKBRTMutableOrderIndexSet *v81;
  _UIKBRTMutableOrderIndexSet *v82;
  _UIKBRTMutableOrderIndexSet *v83;
  void *v84;
  _BOOL4 v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  id v89;
  uint64_t j;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  unint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  _UIKBRTFingerInfo *v102;
  _UIKBRTFakeFingerInfo *v103;
  _UIKBRTFingerInfo *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  _UIKBRTFingerInfo *v125;
  _UIKBRTFakeFingerInfo *v126;
  _UIKBRTFingerInfo *v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  _UIKBRTFingerInfo *v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  _UIKBRTFingerInfo *v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  void *v174;
  void *v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  void *v185;
  void *v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  CGFloat v198;
  _UIKBRTFingerInfo *v199;
  id *v200;
  id v201;
  uint64_t v202;
  void *v203;
  void *v204;
  uint64_t v205;
  id v206;
  uint64_t v207;
  void *v208;
  double v209;
  double v210;
  void *v211;
  double v212;
  double v213;
  void *v214;
  double v215;
  double v216;
  void *v217;
  double v218;
  double v219;
  double rect1;
  double v221;
  double v222;
  double v223;
  double v224;
  double rect2;
  void *v226;
  double v227;
  void *v228;
  void *v229;
  double v230;
  void *v231;
  void *v232;
  double v233;
  uint64_t v234;
  uint64_t v235;
  CGFloat v236;
  unint64_t v237;
  id v238;
  void *v239;
  void *v240;
  _UIKBRTFingerDetection *v241;
  _QWORD v242[4];
  id v243;
  _QWORD v244[4];
  id v245;
  _QWORD v246[4];
  id v247;
  _QWORD v248[4];
  _UIKBRTMutableOrderIndexSet *v249;
  _QWORD v250[3];
  _QWORD v251[4];
  id v252;
  _UIKBRTMutableOrderIndexSet *v253;
  id v254;
  _UIKBRTMutableOrderIndexSet *v255;
  _QWORD v256[4];
  _UIKBRTMutableOrderIndexSet *v257;
  _QWORD v258[6];
  _QWORD v259[4];
  id v260;
  _QWORD *v261;
  _QWORD *v262;
  _QWORD *v263;
  uint64_t *v264;
  double v265;
  _QWORD v266[4];
  _QWORD v267[4];
  _QWORD v268[4];
  _QWORD v269[6];
  _QWORD v270[5];
  _QWORD v271[6];
  _QWORD v272[5];
  uint64_t v273;
  double *v274;
  uint64_t v275;
  uint64_t v276;
  CGRect v277;
  CGRect v278;
  CGRect v279;
  CGRect v280;
  CGRect v281;

  if (!-[NSMutableDictionary count](self->_touches, "count"))
  {
    -[_UIKBRTFingerDetection _updateFingerFeedback](self, "_updateFingerFeedback");
    return;
  }
  v241 = self;
  -[NSMutableDictionary allValues](self->_touches, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_376);
  v273 = 0;
  v274 = (double *)&v273;
  v275 = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v276 = 0;
  v272[0] = MEMORY[0x1E0C809B0];
  v272[1] = 3221225472;
  v272[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_2;
  v272[3] = &unk_1E16D8730;
  v272[4] = &v273;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v272);
  v8 = v274[3];
  v9 = objc_msgSend(v6, "count");
  v274[3] = 0.0;
  v271[0] = v7;
  v271[1] = 3221225472;
  v10 = v8 / (double)v9;
  v271[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_3;
  v271[3] = &unk_1E16D8758;
  *(double *)&v271[5] = v10;
  v271[4] = &v273;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v271);
  v11 = v274[3];
  v12 = objc_msgSend(v6, "count");
  _Block_object_dispose(&v273, 8);
  v13 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  v14 = v241;
  -[_UIKBRTKeyboardTouchObserver rowOffsets](v241, "rowOffsets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  v17 = v16 - -[_UIKBRTKeyboardTouchObserver homeRowOffsetIndex](v241, "homeRowOffsetIndex");

  if (v17 < 2)
  {
    if ((unint64_t)objc_msgSend(v6, "count") < 4)
      goto LABEL_8;
    v269[0] = v7;
    v269[1] = 3221225472;
    v269[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_5;
    v269[3] = &__block_descriptor_48_e34_B32__0___UIKBRTFingerInfo_8Q16_B24l;
    *(double *)&v269[4] = v10;
    *(double *)&v269[5] = v11 / (double)v12;
    v23 = v269;
  }
  else
  {
    -[_UIKBRTKeyboardTouchObserver fCenter](v241, "fCenter");
    v19 = v18;
    -[_UIKBRTKeyboardTouchObserver jCenter](v241, "jCenter");
    v21 = (v19 + v20) * 0.5;
    -[_UIKBRTKeyboardTouchObserver keySize](v241, "keySize");
    v270[0] = v7;
    v270[1] = 3221225472;
    v270[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_4;
    v270[3] = &__block_descriptor_40_e34_B32__0___UIKBRTFingerInfo_8Q16_B24l;
    *(double *)&v270[4] = v21 + ((double)v17 + -0.5) * v22;
    v23 = v270;
  }
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", v23);
  v24 = objc_claimAutoreleasedReturnValue();

  v13 = (id)v24;
LABEL_8:
  if (objc_msgSend(v13, "count"))
  {
    if (objc_msgSend(v13, "count") == 1)
    {
      v25 = objc_msgSend(v13, "firstIndex");
      objc_msgSend(v6, "objectAtIndex:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "location");
      v28 = v27;
      if (v25)
      {
        objc_msgSend(v6, "objectAtIndex:", v25 - 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "location");
        v31 = v28 - v30;

      }
      else
      {
        v31 = 1.79769313e308;
      }
      v38 = v25 + 1;
      if (v38 >= objc_msgSend(v6, "count"))
      {
        v41 = 1.79769313e308;
      }
      else
      {
        objc_msgSend(v6, "objectAtIndex:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "location");
        v41 = v40 - v28;

      }
      if (v31 == v41)
      {
        -[_UIKBRTKeyboardTouchObserver fCenter](v241, "fCenter");
        v31 = vabdd_f64(v28, v42);
        -[_UIKBRTKeyboardTouchObserver jCenter](v241, "jCenter");
        v41 = vabdd_f64(v28, v43);
      }
      if (v31 >= v41)
        v44 = 8;
      else
        v44 = 7;
      if (v31 >= v41)
        v32 = v26;
      else
        v32 = 0;
      if (v31 >= v41)
        v33 = 0;
      else
        v33 = v26;
      objc_msgSend(v26, "setIdentity:", v44);

    }
    else
    {
      if ((unint64_t)objc_msgSend(v13, "count") >= 3)
      {
        v273 = 0;
        v274 = (double *)&v273;
        v275 = 0x2020000000;
        v276 = 0x7FFFFFFFFFFFFFFFLL;
        v268[0] = 0;
        v268[1] = v268;
        v268[2] = 0x2020000000;
        v268[3] = 0x7FEFFFFFFFFFFFFFLL;
        v267[0] = 0;
        v267[1] = v267;
        v267[2] = 0x2020000000;
        v267[3] = 0x7FFFFFFFFFFFFFFFLL;
        v266[0] = 0;
        v266[1] = v266;
        v266[2] = 0x2020000000;
        v266[3] = 0x7FEFFFFFFFFFFFFFLL;
        -[_UIKBRTKeyboardTouchObserver fCenter](v241, "fCenter");
        v35 = v34;
        -[_UIKBRTKeyboardTouchObserver jCenter](v241, "jCenter");
        v259[0] = v7;
        v259[1] = 3221225472;
        v259[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_6;
        v259[3] = &unk_1E16D87C0;
        v265 = (v35 + v36) * 0.5;
        v260 = v6;
        v261 = v268;
        v262 = v266;
        v263 = v267;
        v264 = &v273;
        objc_msgSend(v13, "enumerateRangesUsingBlock:", v259);
        v258[0] = v7;
        v258[1] = 3221225472;
        v258[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_7;
        v258[3] = &unk_1E16D87E8;
        v258[4] = &v273;
        v258[5] = v267;
        objc_msgSend(v13, "indexesPassingTest:", v258);
        v37 = objc_claimAutoreleasedReturnValue();

        _Block_object_dispose(v266, 8);
        _Block_object_dispose(v267, 8);
        _Block_object_dispose(v268, 8);
        _Block_object_dispose(&v273, 8);
        v13 = (id)v37;
        v14 = v241;
      }
      objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v13, "firstIndex"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v13, "lastIndex"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setIdentity:", 7);
      objc_msgSend(v32, "setIdentity:", 8);
    }
    objc_msgSend(v6, "removeObjectsAtIndexes:", v13);
  }
  else
  {
    v32 = 0;
    v33 = 0;
  }
  if (objc_msgSend(v6, "count") == 8)
  {
    v256[0] = v7;
    v256[1] = 3221225472;
    v256[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_8;
    v256[3] = &unk_1E16D8810;
    v257 = (_UIKBRTMutableOrderIndexSet *)&unk_1E1A942F8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v256);
    fakeLeftIndex = v14->_fakeLeftIndex;
    v14->_fakeLeftIndex = 0;

    fakeRightIndex = v14->_fakeRightIndex;
    v14->_fakeRightIndex = 0;

    v47 = v257;
LABEL_125:

    goto LABEL_126;
  }
  if (objc_msgSend(v6, "count"))
  {
    v237 = a3;
    v239 = v33;
    v47 = objc_alloc_init(_UIKBRTMutableOrderIndexSet);
    v48 = objc_alloc_init(_UIKBRTMutableOrderIndexSet);
    v238 = v13;
    if (objc_msgSend(v13, "count"))
    {
      v251[0] = v7;
      v251[1] = 3221225472;
      v251[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_9;
      v251[3] = &unk_1E16D86E8;
      v49 = &v252;
      v252 = v33;
      v50 = (id *)&v253;
      v253 = v47;
      v254 = v32;
      v255 = v48;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v251);

    }
    else
    {
      -[_UIKBRTKeyboardTouchObserver fCenter](v14, "fCenter");
      v52 = v51;
      -[_UIKBRTKeyboardTouchObserver keySize](v14, "keySize");
      v54 = v52 + v53 * 0.5;
      -[_UIKBRTKeyboardTouchObserver jCenter](v14, "jCenter");
      v56 = v55;
      -[_UIKBRTKeyboardTouchObserver keySize](v14, "keySize");
      v58 = v56 - v57 * 0.5;
      v248[0] = v7;
      v248[1] = 3221225472;
      v248[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_10;
      v248[3] = &unk_1E16D8838;
      *(double *)&v250[1] = v54;
      v49 = (id *)&v249;
      v249 = v47;
      *(double *)&v250[2] = v58;
      v50 = (id *)v250;
      v250[0] = v48;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v248);
    }

    if (-[_UIKBRTMutableOrderIndexSet count](v47, "count") >= 5)
    {
      do
        -[_UIKBRTMutableOrderIndexSet removeIndex:](v47, "removeIndex:", -[_UIKBRTMutableOrderIndexSet highestIndex](v47, "highestIndex"));
      while (-[_UIKBRTMutableOrderIndexSet count](v47, "count") > 4);
    }
    if (-[_UIKBRTMutableOrderIndexSet count](v48, "count") >= 5)
    {
      do
        -[_UIKBRTMutableOrderIndexSet removeIndex:](v48, "removeIndex:", -[_UIKBRTMutableOrderIndexSet lowestIndex](v48, "lowestIndex"));
      while (-[_UIKBRTMutableOrderIndexSet count](v48, "count") > 4);
    }
    v59 = -[_UIKBRTMutableOrderIndexSet initWithIndexesInRange:]([_UIKBRTMutableOrderIndexSet alloc], "initWithIndexesInRange:", 0, objc_msgSend(v6, "count"));
    -[_UIKBRTMutableOrderIndexSet indexSet](v47, "indexSet");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBRTMutableOrderIndexSet removeIndexes:](v59, "removeIndexes:", v60);

    -[_UIKBRTMutableOrderIndexSet indexSet](v48, "indexSet");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKBRTMutableOrderIndexSet removeIndexes:](v59, "removeIndexes:", v61);

    v240 = v32;
    if (!-[_UIKBRTMutableOrderIndexSet count](v59, "count"))
      goto LABEL_81;
    if (-[_UIKBRTMutableOrderIndexSet count](v47, "count") && -[_UIKBRTMutableOrderIndexSet count](v48, "count"))
    {
      v62 = -[_UIKBRTMutableOrderIndexSet count](v47, "count");
      if (v62 <= -[_UIKBRTMutableOrderIndexSet count](v48, "count"))
      {
        v63 = -[_UIKBRTMutableOrderIndexSet count](v47, "count");
        v64 = v47;
        v65 = v48;
        if (v63 == -[_UIKBRTMutableOrderIndexSet count](v48, "count"))
        {
LABEL_48:
          -[_UIKBRTKeyboardTouchObserver fCenter](v14, "fCenter");
          v67 = v66;
          objc_msgSend(v6, "objectAtIndex:", -[_UIKBRTMutableOrderIndexSet lowestIndex](v64, "lowestIndex"));
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "location");
          v70 = v67 - v69;

          objc_msgSend(v6, "objectAtIndex:", -[_UIKBRTMutableOrderIndexSet highestIndex](v65, "highestIndex"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "location");
          v73 = v72;
          -[_UIKBRTKeyboardTouchObserver jCenter](v14, "jCenter");
          v75 = v73 - v74;

          v76 = v70 > v75;
LABEL_53:
          v77 = 0;
          for (i = -1; i <= v77; ++i)
          {
            if ((v76 & 1) != 0)
            {
              -[_UIKBRTMutableOrderIndexSet setReversed:](v47, "setReversed:", 1);
              -[_UIKBRTMutableOrderIndexSet setReversed:](v59, "setReversed:", 1);
              -[_UIKBRTMutableOrderIndexSet setReversed:](v48, "setReversed:", 1);
              v79 = v14;
              v80 = v6;
              v81 = v47;
              v82 = v48;
              v83 = v59;
              v84 = v33;
            }
            else
            {
              -[_UIKBRTMutableOrderIndexSet setReversed:](v47, "setReversed:", 0);
              -[_UIKBRTMutableOrderIndexSet setReversed:](v59, "setReversed:", 0);
              -[_UIKBRTMutableOrderIndexSet setReversed:](v48, "setReversed:", 0);
              v79 = v14;
              v80 = v6;
              v81 = v48;
              v82 = v47;
              v83 = v59;
              v84 = v240;
            }
            v85 = -[_UIKBRTFingerDetection _linkTouchesInArray:withIndexes:opposingHandIndexes:unassignedIndexes:thumb:](v79, "_linkTouchesInArray:withIndexes:opposingHandIndexes:unassignedIndexes:thumb:", v80, v81, v82, v83, v84);
            if (!-[_UIKBRTMutableOrderIndexSet count](v59, "count"))
              break;
            if (v85)
              v77 = 1;
            v76 ^= 1u;
          }
          -[_UIKBRTMutableOrderIndexSet setReversed:](v47, "setReversed:", 0);
          -[_UIKBRTMutableOrderIndexSet setReversed:](v48, "setReversed:", 0);
          -[_UIKBRTMutableOrderIndexSet setReversed:](v59, "setReversed:", 0);
          if (-[_UIKBRTMutableOrderIndexSet count](v59, "count") >= 2)
          {
            do
            {
              if (-[_UIKBRTMutableOrderIndexSet count](v47, "count") >= 4
                && -[_UIKBRTMutableOrderIndexSet count](v48, "count") > 3)
              {
                break;
              }
              if (-[_UIKBRTMutableOrderIndexSet count](v47, "count") <= 3)
              {
                -[_UIKBRTMutableOrderIndexSet addIndex:](v47, "addIndex:", -[_UIKBRTMutableOrderIndexSet lowestIndex](v59, "lowestIndex"));
                -[_UIKBRTMutableOrderIndexSet removeIndex:](v59, "removeIndex:", -[_UIKBRTMutableOrderIndexSet lowestIndex](v59, "lowestIndex"));
              }
              if (-[_UIKBRTMutableOrderIndexSet count](v48, "count") <= 3)
              {
                -[_UIKBRTMutableOrderIndexSet addIndex:](v48, "addIndex:", -[_UIKBRTMutableOrderIndexSet highestIndex](v59, "highestIndex"));
                -[_UIKBRTMutableOrderIndexSet removeIndex:](v59, "removeIndex:", -[_UIKBRTMutableOrderIndexSet highestIndex](v59, "highestIndex"));
              }
            }
            while (-[_UIKBRTMutableOrderIndexSet count](v59, "count") > 1);
          }
          if (-[_UIKBRTMutableOrderIndexSet count](v59, "count")
            && (-[_UIKBRTMutableOrderIndexSet count](v47, "count") < 4
             || -[_UIKBRTMutableOrderIndexSet count](v48, "count") <= 3))
          {
            v86 = -[_UIKBRTMutableOrderIndexSet count](v47, "count");
            if (v86 > -[_UIKBRTMutableOrderIndexSet count](v48, "count")
              && -[_UIKBRTMutableOrderIndexSet count](v47, "count") < 4
              || -[_UIKBRTMutableOrderIndexSet count](v48, "count") == 4)
            {
              goto LABEL_75;
            }
            v88 = -[_UIKBRTMutableOrderIndexSet count](v48, "count");
            if (v88 > -[_UIKBRTMutableOrderIndexSet count](v47, "count")
              && -[_UIKBRTMutableOrderIndexSet count](v48, "count") < 4
              || -[_UIKBRTMutableOrderIndexSet count](v47, "count") == 4)
            {
              goto LABEL_79;
            }
            if (-[_UIKBRTMutableOrderIndexSet count](v47, "count")
              && -[_UIKBRTMutableOrderIndexSet count](v48, "count"))
            {
              objc_msgSend(v6, "objectAtIndex:", -[_UIKBRTMutableOrderIndexSet lowestIndex](v59, "lowestIndex"));
              v208 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v208, "location");
              v210 = v209;
              objc_msgSend(v6, "objectAtIndex:", -[_UIKBRTMutableOrderIndexSet highestIndex](v47, "highestIndex"));
              v211 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v211, "location");
              v213 = v210 - v212;

              objc_msgSend(v6, "objectAtIndex:", -[_UIKBRTMutableOrderIndexSet lowestIndex](v48, "lowestIndex"));
              v214 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v214, "location");
              v216 = v215;
              objc_msgSend(v6, "objectAtIndex:", -[_UIKBRTMutableOrderIndexSet highestIndex](v59, "highestIndex"));
              v217 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v217, "location");
              v219 = v216 - v218;

              if (v213 > v219)
              {
LABEL_75:
                -[_UIKBRTMutableOrderIndexSet addIndex:](v47, "addIndex:", -[_UIKBRTMutableOrderIndexSet lowestIndex](v59, "lowestIndex"));
                v87 = -[_UIKBRTMutableOrderIndexSet lowestIndex](v59, "lowestIndex");
LABEL_80:
                -[_UIKBRTMutableOrderIndexSet removeIndex:](v59, "removeIndex:", v87);
                goto LABEL_81;
              }
              if (v213 >= v219)
                goto LABEL_81;
LABEL_79:
              -[_UIKBRTMutableOrderIndexSet addIndex:](v48, "addIndex:", -[_UIKBRTMutableOrderIndexSet highestIndex](v59, "highestIndex"));
              v87 = -[_UIKBRTMutableOrderIndexSet highestIndex](v59, "highestIndex");
              goto LABEL_80;
            }
          }
LABEL_81:
          v89 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          for (j = 0; j != 13; ++j)
          {
            v91 = objc_alloc_init(MEMORY[0x1E0CB3788]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", j);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "setObject:forKey:", v91, v92);

          }
          objc_msgSend(v89, "objectForKey:", &unk_1E1A991C8);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "addIndexesInRange:", 0, objc_msgSend(v6, "count"));

          -[_UIKBRTMutableOrderIndexSet setReversed:](v47, "setReversed:", 0);
          v14 = v241;
          -[_UIKBRTFingerDetection _updateTouchInfoFromOutsideInWithArray:indexes:newIdentityDict:fakeIndex:](v241, "_updateTouchInfoFromOutsideInWithArray:indexes:newIdentityDict:fakeIndex:", v6, v47, v89, v241->_fakeLeftIndex);
          -[_UIKBRTMutableOrderIndexSet setReversed:](v48, "setReversed:", 1);
          -[_UIKBRTFingerDetection _updateTouchInfoFromOutsideInWithArray:indexes:newIdentityDict:fakeIndex:](v14, "_updateTouchInfoFromOutsideInWithArray:indexes:newIdentityDict:fakeIndex:", v6, v48, v89, v14->_fakeRightIndex);
          objc_msgSend(v89, "objectForKey:", &unk_1E1A990C0);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v235 = objc_msgSend(v94, "count");

          objc_msgSend(v89, "objectForKey:", &unk_1E1A99150);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = objc_msgSend(v95, "count");

          if (v237 == 6)
          {
            v98 = -[_UIKBRTMutableOrderIndexSet count](v47, "count");
            v7 = MEMORY[0x1E0C809B0];
            v33 = v239;
            if (v98 >= 3)
            {
              objc_msgSend(v89, "removeObjectForKey:", &unk_1E1A990C0);
              objc_msgSend(v89, "removeObjectForKey:", &unk_1E1A990D8);
              objc_msgSend(v89, "removeObjectForKey:", &unk_1E1A990F0);
              objc_msgSend(v89, "removeObjectForKey:", &unk_1E1A99108);
              v97 = &unk_1E1A990A8;
              goto LABEL_89;
            }
LABEL_124:
            v246[0] = v7;
            v246[1] = 3221225472;
            v246[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_11;
            v246[3] = &unk_1E16D8888;
            v247 = v6;
            objc_msgSend(v89, "enumerateKeysAndObjectsUsingBlock:", v246);

            v13 = v238;
            v32 = v240;
            goto LABEL_125;
          }
          v234 = v96;
          v7 = MEMORY[0x1E0C809B0];
          v33 = v239;
          if (v237 == 9)
          {
            if (-[_UIKBRTMutableOrderIndexSet count](v48, "count") >= 3)
            {
              objc_msgSend(v89, "removeObjectForKey:", &unk_1E1A99150);
              objc_msgSend(v89, "removeObjectForKey:", &unk_1E1A99168);
              objc_msgSend(v89, "removeObjectForKey:", &unk_1E1A99180);
              objc_msgSend(v89, "removeObjectForKey:", &unk_1E1A99198);
              v97 = &unk_1E1A99138;
LABEL_89:
              objc_msgSend(v89, "removeObjectForKey:", v97);
              goto LABEL_124;
            }
            goto LABEL_124;
          }
          if (-[_UIKBRTMutableOrderIndexSet count](v47, "count") != 3 || v235)
          {
            v100 = v241->_fakeLeftIndex;
            if (!v100)
            {
LABEL_100:
              if (-[_UIKBRTMutableOrderIndexSet count](v48, "count") != 3 || v234)
              {
                v124 = v241->_fakeRightIndex;
                if (!v124)
                  goto LABEL_110;
                v241->_fakeRightIndex = 0;
              }
              else
              {
                -[_UIKBRTMutableOrderIndexSet indexSet](v48, "indexSet");
                v123 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "objectsAtIndexes:", v123);
                v124 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v124, "objectAtIndex:", 0);
                v232 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v124, "objectAtIndex:", 1);
                v229 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v124, "objectAtIndex:", 2);
                v226 = (void *)objc_claimAutoreleasedReturnValue();
                v125 = v241->_fakeRightIndex;
                if (!v125)
                {
                  v126 = objc_alloc_init(_UIKBRTFakeFingerInfo);
                  v127 = v241->_fakeRightIndex;
                  v241->_fakeRightIndex = &v126->super;

                  -[_UIKBRTFingerInfo setIdentity:](v241->_fakeRightIndex, "setIdentity:", 9);
                  -[_UIKBRTFingerInfo setUnknownSeen:](v241->_fakeRightIndex, "setUnknownSeen:", 1);
                  v125 = v241->_fakeRightIndex;
                }
                if (-[_UIKBRTFingerInfo unknownSeen](v125, "unknownSeen"))
                {
                  objc_msgSend(v232, "radius");
                  v129 = v128;
                  objc_msgSend(v229, "radius");
                  -[_UIKBRTFingerInfo setRadius:](v241->_fakeRightIndex, "setRadius:", (v129 + v130) * 0.5);
                  objc_msgSend(v232, "location");
                  v132 = v131;
                  objc_msgSend(v232, "location");
                  v134 = v133;
                  objc_msgSend(v229, "location");
                  v136 = (v134 - v135) * 4.0;
                  objc_msgSend(v229, "location");
                  v138 = v137;
                  objc_msgSend(v226, "location");
                  v140 = v132 + (v136 + v138 - v139) / 5.0;
                  objc_msgSend(v226, "location");
                  v142 = v141 * 4.0;
                  objc_msgSend(v229, "location");
                  v144 = v142 + v143;
                  objc_msgSend(v232, "location");
                  -[_UIKBRTFingerInfo setLocation:](v241->_fakeRightIndex, "setLocation:", v140, (v144 + v145) / 6.0);
                }

              }
LABEL_110:
              v146 = v241->_fakeLeftIndex;
              if (v146)
              {
                v147 = *MEMORY[0x1E0C9D648];
                v148 = *(double *)(MEMORY[0x1E0C9D648] + 8);
                v149 = *(double *)(MEMORY[0x1E0C9D648] + 16);
                v150 = *(double *)(MEMORY[0x1E0C9D648] + 24);
                -[_UIKBRTFingerInfo location](v146, "location");
                v152 = v151;
                -[_UIKBRTFingerInfo radius](v241->_fakeLeftIndex, "radius");
                v154 = v152 - v153;
                -[_UIKBRTFingerInfo location](v241->_fakeLeftIndex, "location");
                v156 = v155;
                -[_UIKBRTFingerInfo radius](v241->_fakeLeftIndex, "radius");
                v223 = v156 - v157;
                -[_UIKBRTFingerInfo radius](v241->_fakeLeftIndex, "radius");
                v159 = v158 + v158;
                -[_UIKBRTFingerInfo radius](v241->_fakeLeftIndex, "radius");
                v160 = v241->_fakeRightIndex;
                v162 = v161 + v161;
                v224 = v150;
                rect2 = v149;
                v227 = v148;
                v230 = v147;
                v233 = v147;
                v7 = MEMORY[0x1E0C809B0];
                if (!v160)
                  goto LABEL_116;
              }
              else
              {
                v160 = v241->_fakeRightIndex;
                v7 = MEMORY[0x1E0C809B0];
                if (!v160)
                  goto LABEL_124;
                v148 = *(double *)(MEMORY[0x1E0C9D648] + 8);
                v149 = *(double *)(MEMORY[0x1E0C9D648] + 16);
                v162 = *(double *)(MEMORY[0x1E0C9D648] + 24);
                v154 = *MEMORY[0x1E0C9D648];
                v233 = *MEMORY[0x1E0C9D648];
                v223 = v148;
                v159 = v149;
                v150 = v162;
              }
              v163 = v162;
              -[_UIKBRTFingerInfo location](v160, "location");
              v165 = v164;
              -[_UIKBRTFingerInfo radius](v241->_fakeRightIndex, "radius");
              v230 = v165 - v166;
              -[_UIKBRTFingerInfo location](v241->_fakeRightIndex, "location");
              v168 = v167;
              -[_UIKBRTFingerInfo radius](v241->_fakeRightIndex, "radius");
              v227 = v168 - v169;
              -[_UIKBRTFingerInfo radius](v241->_fakeRightIndex, "radius");
              rect2 = v170 + v170;
              -[_UIKBRTFingerInfo radius](v241->_fakeRightIndex, "radius");
              v162 = v163;
              v224 = v171 + v171;
LABEL_116:
              v221 = v149;
              v222 = v233;
              v172 = v148;
              rect1 = v150;
              if (v235)
              {
                v173 = v162;
                objc_msgSend(v89, "objectForKey:", &unk_1E1A990C0);
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v174, "firstIndex"));
                v175 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v175, "location");
                v177 = v176;
                objc_msgSend(v175, "radius");
                v222 = v177 - v178;
                objc_msgSend(v175, "location");
                v180 = v179;
                objc_msgSend(v175, "radius");
                v172 = v180 - v181;
                objc_msgSend(v175, "radius");
                v221 = v182 + v182;
                objc_msgSend(v175, "radius");
                rect1 = v183 + v183;

                v162 = v173;
              }
              v236 = v172;
              if (v234)
              {
                v184 = v162;
                objc_msgSend(v89, "objectForKey:", &unk_1E1A99150);
                v185 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v185, "firstIndex"));
                v186 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v186, "location");
                v188 = v187;
                objc_msgSend(v186, "radius");
                v233 = v188 - v189;
                objc_msgSend(v186, "location");
                v191 = v190;
                objc_msgSend(v186, "radius");
                v148 = v191 - v192;
                objc_msgSend(v186, "radius");
                v149 = v193 + v193;
                objc_msgSend(v186, "radius");
                v150 = v194 + v194;

                v162 = v184;
              }
              v195 = v154;
              v279.size.height = v224;
              v196 = v223;
              v197 = v159;
              v198 = v162;
              v279.origin.y = v227;
              v279.origin.x = v230;
              v279.size.width = rect2;
              if (CGRectIntersectsRect(*(CGRect *)(&v162 - 3), v279))
                goto LABEL_122;
              v277.origin.x = v154;
              v277.origin.y = v223;
              v277.size.width = v159;
              v277.size.height = v198;
              v280.origin.x = v233;
              v280.origin.y = v148;
              v280.size.width = v149;
              v280.size.height = v150;
              if (CGRectIntersectsRect(v277, v280))
              {
LABEL_122:
                v199 = v241->_fakeLeftIndex;
                v241->_fakeLeftIndex = 0;
              }
              else
              {
                v278.size.width = v221;
                v278.origin.x = v222;
                v278.origin.y = v236;
                v278.size.height = rect1;
                v281.origin.y = v227;
                v281.origin.x = v230;
                v281.size.height = v224;
                v281.size.width = rect2;
                if (!CGRectIntersectsRect(v278, v281))
                  goto LABEL_124;
                v199 = v241->_fakeRightIndex;
                v241->_fakeRightIndex = 0;
              }

              goto LABEL_124;
            }
            v241->_fakeLeftIndex = 0;
          }
          else
          {
            -[_UIKBRTMutableOrderIndexSet indexSet](v47, "indexSet");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectsAtIndexes:", v99);
            v100 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v100, "objectAtIndex:", 0);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "objectAtIndex:", 1);
            v231 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "objectAtIndex:", 2);
            v228 = (void *)objc_claimAutoreleasedReturnValue();
            v102 = v241->_fakeLeftIndex;
            if (!v102)
            {
              v103 = objc_alloc_init(_UIKBRTFakeFingerInfo);
              v104 = v241->_fakeLeftIndex;
              v241->_fakeLeftIndex = &v103->super;

              -[_UIKBRTFingerInfo setIdentity:](v241->_fakeLeftIndex, "setIdentity:", 6);
              -[_UIKBRTFingerInfo setUnknownSeen:](v241->_fakeLeftIndex, "setUnknownSeen:", 1);
              v102 = v241->_fakeLeftIndex;
            }
            if (-[_UIKBRTFingerInfo unknownSeen](v102, "unknownSeen"))
            {
              objc_msgSend(v231, "radius");
              v106 = v105;
              objc_msgSend(v228, "radius");
              -[_UIKBRTFingerInfo setRadius:](v241->_fakeLeftIndex, "setRadius:", (v106 + v107) * 0.5);
              objc_msgSend(v228, "location");
              v109 = v108;
              objc_msgSend(v228, "location");
              v111 = v110;
              objc_msgSend(v231, "location");
              v113 = (v111 - v112) * 4.0;
              objc_msgSend(v231, "location");
              v115 = v114;
              objc_msgSend(v101, "location");
              v117 = v109 + (v113 + v115 - v116) / 5.0;
              objc_msgSend(v101, "location");
              v119 = v118 * 4.0;
              objc_msgSend(v231, "location");
              v121 = v119 + v120;
              objc_msgSend(v228, "location");
              -[_UIKBRTFingerInfo setLocation:](v241->_fakeLeftIndex, "setLocation:", v117, (v121 + v122) / 6.0);
            }

          }
          goto LABEL_100;
        }
LABEL_52:
        v76 = 0;
        goto LABEL_53;
      }
    }
    else if (!-[_UIKBRTMutableOrderIndexSet count](v47, "count"))
    {
      v64 = v59;
      v65 = v59;
      if (!-[_UIKBRTMutableOrderIndexSet count](v48, "count"))
        goto LABEL_48;
      goto LABEL_52;
    }
    v76 = 1;
    goto LABEL_53;
  }
LABEL_126:
  if (!v33 || v32)
  {
    if (v33 || !v32)
      goto LABEL_139;
    v242[0] = v7;
    v242[1] = 3221225472;
    v242[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_14;
    v242[3] = &unk_1E16D88B0;
    v200 = &v243;
    v206 = v32;
    v243 = v206;
    v207 = objc_msgSend(v6, "indexOfObjectWithOptions:passingTest:", 2, v242);
    if (v207 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "objectAtIndex:", v207);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(objc_msgSend(v203, "identity") - 3) <= 3)
      {
        v204 = v206;
        v205 = 7;
        goto LABEL_136;
      }
LABEL_137:

    }
  }
  else
  {
    v244[0] = v7;
    v244[1] = 3221225472;
    v244[2] = __54___UIKBRTFingerDetection__updateTouchInfoForFingerID___block_invoke_13;
    v244[3] = &unk_1E16D88B0;
    v200 = &v245;
    v201 = v33;
    v245 = v201;
    v202 = objc_msgSend(v6, "indexOfObjectPassingTest:", v244);
    if (v202 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "objectAtIndex:", v202);
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)(objc_msgSend(v203, "identity") - 9) <= 3)
      {
        v204 = v201;
        v205 = 8;
LABEL_136:
        objc_msgSend(v204, "setIdentity:", v205, *(_QWORD *)&rect1);
        goto LABEL_137;
      }
      goto LABEL_137;
    }
  }

LABEL_139:
  -[_UIKBRTFingerDetection _updateFingerFeedback](v14, "_updateFingerFeedback", *(_QWORD *)&rect1);

}

- (void)_updateFingerFeedback
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _UIKBRTFingerDetectionView *feedbackView;
  NSMapTable *fingerFeedbackViewMap;
  int v15;
  _UIKBRTFingerDetectionView *v16;
  _UIKBRTFingerDetectionView *v17;
  _UIKBRTFingerDetectionView *v18;
  NSMapTable *v19;
  NSMapTable *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v3 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1)
    goto LABEL_4;
  v15 = _UIInternalPreference__UIKBRT_FingerDetectionFeedback;
  if (_UIInternalPreferencesRevisionVar == _UIInternalPreference__UIKBRT_FingerDetectionFeedback)
    goto LABEL_4;
  while (v3 >= v15)
  {
    _UIInternalPreferenceSync(v3, &_UIInternalPreference__UIKBRT_FingerDetectionFeedback, (uint64_t)CFSTR("_UIKBRT_FingerDetectionFeedback"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    v15 = _UIInternalPreference__UIKBRT_FingerDetectionFeedback;
    if (v3 == _UIInternalPreference__UIKBRT_FingerDetectionFeedback)
      goto LABEL_4;
  }
  if (!byte_1EDDA818C)
  {
LABEL_4:
    if (self->_feedbackView)
    {
      -[NSMapTable objectForKey:](self->_fingerFeedbackViewMap, "objectForKey:", self->_fakeLeftIndex);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable removeObjectForKey:](self->_fingerFeedbackViewMap, "removeObjectForKey:", self->_fakeLeftIndex);
      objc_msgSend(v4, "removeFromSuperview");
      -[NSMapTable objectForKey:](self->_fingerFeedbackViewMap, "objectForKey:", self->_fakeRightIndex);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMapTable removeObjectForKey:](self->_fingerFeedbackViewMap, "removeObjectForKey:", self->_fakeRightIndex);
      objc_msgSend(v5, "removeFromSuperview");
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      -[NSMutableDictionary allValues](self->_touches, "allValues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v24;
        do
        {
          v10 = 0;
          v11 = v5;
          do
          {
            if (*(_QWORD *)v24 != v9)
              objc_enumerationMutation(v6);
            v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10);
            -[NSMapTable objectForKey:](self->_fingerFeedbackViewMap, "objectForKey:", v12);
            v5 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSMapTable removeObjectForKey:](self->_fingerFeedbackViewMap, "removeObjectForKey:", v12);
            objc_msgSend(v5, "removeFromSuperview");
            ++v10;
            v11 = v5;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v8);
      }

      -[UIView removeFromSuperview](self->_feedbackView, "removeFromSuperview");
      feedbackView = self->_feedbackView;
      self->_feedbackView = 0;

      fingerFeedbackViewMap = self->_fingerFeedbackViewMap;
      self->_fingerFeedbackViewMap = 0;

    }
  }
  else
  {
    if (!self->_feedbackView)
    {
      v16 = [_UIKBRTFingerDetectionView alloc];
      v17 = -[_UIKBRTFingerDetectionView initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v18 = self->_feedbackView;
      self->_feedbackView = v17;

      -[UIView addSubview:](self->_feedbackParentView, "addSubview:", self->_feedbackView);
      v19 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 5, 0);
      v20 = self->_fingerFeedbackViewMap;
      self->_fingerFeedbackViewMap = v19;

    }
    -[UIView bounds](self->_feedbackParentView, "bounds");
    -[UIView setFrame:](self->_feedbackView, "setFrame:");
    -[UIView bringSubviewToFront:](self->_feedbackParentView, "bringSubviewToFront:", self->_feedbackView);
    -[NSMutableDictionary allValues](self->_touches, "allValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (id)objc_msgSend(v21, "mutableCopy");

    if (self->_fakeLeftIndex)
      objc_msgSend(v22, "addObject:");
    if (self->_fakeRightIndex)
      objc_msgSend(v22, "addObject:");
    -[_UIKBRTFingerDetection _updateFingerFeedback:](self, "_updateFingerFeedback:", v22);

  }
}

- (void)_updateFingerFeedback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  _UIKBRTFingerDetectionFingerFeedbackView *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIView subviews](self->_feedbackView, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_fingerFeedbackViewMap, "objectForKey:", v16);
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (_UIKBRTFingerDetectionFingerFeedbackView *)v17;
          objc_msgSend(v6, "removeObject:", v17);
        }
        else
        {
          v18 = -[_UIKBRTFingerDetectionFingerFeedbackView initWithFrame:]([_UIKBRTFingerDetectionFingerFeedbackView alloc], "initWithFrame:", v11, v12, v13, v14);
          -[UIView addSubview:](self->_feedbackView, "addSubview:", v18);
          -[NSMapTable setObject:forKey:](self->_fingerFeedbackViewMap, "setObject:forKey:", v18, v16);
        }
        -[_UIKBRTFingerDetectionFingerFeedbackView setUnknownSeen:](v18, "setUnknownSeen:", objc_msgSend(v16, "unknownSeen"));
        objc_msgSend(v16, "feedbackAlpha");
        -[UIView setAlpha:](v18, "setAlpha:");
        objc_msgSend(v16, "location");
        v20 = v19;
        v22 = v21;
        objc_msgSend(v16, "radius");
        -[_UIKBRTFingerDetectionFingerFeedbackView centerOn:withRadius:andIdentifier:](v18, "centerOn:withRadius:andIdentifier:", objc_msgSend(v16, "identity"), v20, v22, v23);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v9);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v24 = v6;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "removeFromSuperview");
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v26);
  }

}

- (UIView)feedbackParentView
{
  return self->_feedbackParentView;
}

- (void)setFeedbackParentView:(id)a3
{
  self->_feedbackParentView = (UIView *)a3;
}

- (_UIKBRTFingerDetectionView)feedbackView
{
  return self->_feedbackView;
}

- (void)setFeedbackView:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackView, a3);
}

- (NSMapTable)fingerFeedbackViewMap
{
  return self->_fingerFeedbackViewMap;
}

- (void)setFingerFeedbackViewMap:(id)a3
{
  objc_storeStrong((id *)&self->_fingerFeedbackViewMap, a3);
}

- (NSMutableDictionary)touches
{
  return self->_touches;
}

- (void)setTouches:(id)a3
{
  objc_storeStrong((id *)&self->_touches, a3);
}

- (_UIKBRTFingerInfo)fakeLeftIndex
{
  return self->_fakeLeftIndex;
}

- (void)setFakeLeftIndex:(id)a3
{
  objc_storeStrong((id *)&self->_fakeLeftIndex, a3);
}

- (_UIKBRTFingerInfo)fakeRightIndex
{
  return self->_fakeRightIndex;
}

- (void)setFakeRightIndex:(id)a3
{
  objc_storeStrong((id *)&self->_fakeRightIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeRightIndex, 0);
  objc_storeStrong((id *)&self->_fakeLeftIndex, 0);
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_fingerFeedbackViewMap, 0);
  objc_storeStrong((id *)&self->_feedbackView, 0);
}

@end
