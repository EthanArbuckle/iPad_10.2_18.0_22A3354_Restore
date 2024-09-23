@implementation NSValue(TSDMixingAdditions)

- (uint64_t)mixingTypeWithObject:()TSDMixingAdditions
{
  objc_opt_class();
  if ((objc_msgSend(a1, "isEqualToValue:", TSUCheckedDynamicCast()) & 1) != 0)
    return 5;
  if (!strcmp((const char *)objc_msgSend(a1, "objCType"), (const char *)objc_msgSend(a1, "objCType")))
    return 3;
  return 1;
}

- (uint64_t)mixedObjectWithFraction:()TSDMixingAdditions ofObject:
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[48];

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (!strcmp((const char *)objc_msgSend(a1, "objCType"), "{CGPoint=dd}"))
  {
    objc_msgSend(a1, "CGPointValue");
    objc_msgSend(v4, "CGPointValue");
    v9 = (void *)MEMORY[0x24BDD1968];
    TSUMixPoints();
    return objc_msgSend(v9, "valueWithCGPoint:");
  }
  else if (!strcmp((const char *)objc_msgSend(a1, "objCType"), "{CGSize=dd}"))
  {
    objc_msgSend(a1, "CGSizeValue");
    objc_msgSend(v4, "CGSizeValue");
    v10 = (void *)MEMORY[0x24BDD1968];
    TSUMixSizes();
    return objc_msgSend(v10, "valueWithCGSize:");
  }
  else if (!strcmp((const char *)objc_msgSend(a1, "objCType"), "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    objc_msgSend(a1, "CGRectValue");
    objc_msgSend(v4, "CGRectValue");
    v11 = (void *)MEMORY[0x24BDD1968];
    TSUMixRects();
    return objc_msgSend(v11, "valueWithCGRect:");
  }
  else if (!strcmp((const char *)objc_msgSend(a1, "objCType"), "{CGAffineTransform=dddddd}"))
  {
    v12 = 0uLL;
    v44 = 0u;
    v45 = 0u;
    v43 = 0u;
    if (a1)
    {
      objc_msgSend(a1, "CGAffineTransformValue");
      v12 = 0uLL;
    }
    v36 = v12;
    v37 = v12;
    v35 = v12;
    if (v4)
      objc_msgSend(v4, "CGAffineTransformValue");
    v13 = (void *)MEMORY[0x24BDD1968];
    v27 = v43;
    v28 = v44;
    v29 = v45;
    v19 = v35;
    v20 = v36;
    v21 = v37;
    TSDTransformMixAffineTransforms(&v27, &v19, (uint64_t)v51, a2);
    return objc_msgSend(v13, "valueWithCGAffineTransform:", v51);
  }
  else if (!strcmp((const char *)objc_msgSend(a1, "objCType"), "{CATransform3D=dddddddddddddddd}"))
  {
    v14 = 0uLL;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    if (a1)
    {
      objc_msgSend(a1, "CATransform3DValue");
      v14 = 0uLL;
    }
    v41 = v14;
    v42 = v14;
    v39 = v14;
    v40 = v14;
    v37 = v14;
    v38 = v14;
    v35 = v14;
    v36 = v14;
    if (v4)
      objc_msgSend(v4, "CATransform3DValue");
    v15 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v31 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v32 = v15;
    v16 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v33 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v34 = v16;
    v17 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v27 = *MEMORY[0x24BDE5598];
    v28 = v17;
    v18 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v29 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v30 = v18;
    MEMORY[0x219A13858](&v27, &v43, &v35, a2);
    v23 = v31;
    v24 = v32;
    v25 = v33;
    v26 = v34;
    v19 = v27;
    v20 = v28;
    v21 = v29;
    v22 = v30;
    return objc_msgSend(MEMORY[0x24BDD1968], "valueWithCATransform3D:", &v19);
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[NSValue(TSDMixingAdditions) mixedObjectWithFraction:ofObject:]");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMagicMove.m");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 347, CFSTR("Unknown objcType in NSValue: %@"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", objc_msgSend(a1, "objCType")));
    return 0;
  }
}

@end
