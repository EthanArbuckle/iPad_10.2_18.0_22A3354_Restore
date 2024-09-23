@implementation TSULayerSaveRestore

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSULayerSaveRestore;
  -[TSULayerSaveRestore dealloc](&v3, sel_dealloc);
}

- (id)objectForLayer:(id)a3 key:(id)a4
{
  return (id)objc_msgSend(-[TSUNoCopyDictionary objectForKey:](-[TSULayerSaveRestore layerStates](self, "layerStates"), "objectForKey:", a3), "objectForKey:", a4);
}

- (void)saveLayer:(id)a3
{
  TSURetainedPointerKeyDictionary *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;

  if (a3)
  {
    if (!-[TSULayerSaveRestore layerStates](self, "layerStates"))
    {
      v5 = objc_alloc_init(TSURetainedPointerKeyDictionary);
      -[TSULayerSaveRestore setLayerStates:](self, "setLayerStates:", v5);

    }
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = (void *)MEMORY[0x24BDD1968];
    objc_msgSend(a3, "transform");
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v7, "valueWithCATransform3D:", &v15), CFSTR("transform"));
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a3, "opacity");
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v8, "numberWithFloat:"), CFSTR("opacity"));
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a3, "shadowOpacity");
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v9, "numberWithFloat:"), CFSTR("shadowOpacity"));
    v10 = (void *)MEMORY[0x24BDD1968];
    objc_msgSend(a3, "position");
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v10, "valueWithCGPoint:"), CFSTR("position"));
    v11 = (void *)MEMORY[0x24BDD1968];
    objc_msgSend(a3, "anchorPoint");
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v11, "valueWithCGPoint:"), CFSTR("anchorPoint"));
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a3, "isHidden")), CFSTR("hidden"));
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a3, "zPosition");
    *(float *)&v13 = v13;
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(v12, "numberWithFloat:", v13), CFSTR("zPosition"));
    if (objc_msgSend(a3, "superlayer"))
      v14 = objc_msgSend(a3, "superlayer");
    else
      v14 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    objc_msgSend(v6, "setObject:forKey:", v14, CFSTR("superlayer"));
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "superlayer"), "sublayers"), "indexOfObject:", a3)), CFSTR("layerIndex"));
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend((id)objc_msgSend(a3, "animationKeys"), "count") != 0), CFSTR("hasAnimations"));
    -[TSUNoCopyDictionary setObject:forKey:](-[TSULayerSaveRestore layerStates](self, "layerStates"), "setObject:forKey:", v6, a3);

  }
}

- (BOOL)restoreLayer:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  double v12;
  float v13;
  float v14;
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
  uint64_t v28;
  float v29;
  double v30;
  double v31;
  CATransform3D v33;
  CATransform3D a;
  CATransform3D b;
  CATransform3D v36;

  if (a3)
  {
    v5 = -[TSUNoCopyDictionary objectForKey:](-[TSULayerSaveRestore layerStates](self, "layerStates"), "objectForKey:", a3);
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v5, "objectForKey:", CFSTR("superlayer"));
      if (v7)
      {
        v8 = (void *)v7;
        if (v7 != objc_msgSend(MEMORY[0x24BDBCEF8], "null") && v8 != (void *)objc_msgSend(a3, "superlayer"))
          objc_msgSend(v8, "insertSublayer:atIndex:", a3, objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("layerIndex")), "intValue"));
      }
      memset(&v36, 0, sizeof(v36));
      v9 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("transform"));
      if (v9)
        objc_msgSend(v9, "CATransform3DValue");
      else
        memset(&v36, 0, sizeof(v36));
      objc_msgSend(a3, "transform");
      a = v36;
      if (!CATransform3DEqualToTransform(&a, &b))
      {
        v33 = v36;
        objc_msgSend(a3, "setTransform:", &v33);
      }
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("opacity")), "floatValue");
      v11 = v10;
      objc_msgSend(a3, "opacity");
      if (*(float *)&v12 != v11)
      {
        *(float *)&v12 = v11;
        objc_msgSend(a3, "setOpacity:", v12);
      }
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("shadowOpacity")), "floatValue");
      v14 = v13;
      objc_msgSend(a3, "shadowOpacity");
      if (*(float *)&v15 != v14)
      {
        *(float *)&v15 = v14;
        objc_msgSend(a3, "setShadowOpacity:", v15);
      }
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("position")), "CGPointValue");
      v17 = v16;
      v19 = v18;
      objc_msgSend(a3, "position");
      if (v21 != v17 || v20 != v19)
        objc_msgSend(a3, "setPosition:", v17, v19);
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("anchorPoint")), "CGPointValue");
      v23 = v22;
      v25 = v24;
      objc_msgSend(a3, "anchorPoint");
      if (v27 != v23 || v26 != v25)
        objc_msgSend(a3, "setAnchorPoint:", v23, v25);
      v28 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("hidden")), "BOOLValue");
      if ((_DWORD)v28 != objc_msgSend(a3, "isHidden"))
        objc_msgSend(a3, "setHidden:", v28);
      objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("zPosition")), "floatValue");
      v30 = v29;
      objc_msgSend(a3, "zPosition");
      if (v31 != v30)
        objc_msgSend(a3, "setZPosition:", v30);
      if ((objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("hasAnimations")), "BOOLValue") & 1) == 0)
        objc_msgSend(a3, "removeAllAnimations");
      -[TSUNoCopyDictionary removeObjectForKey:](-[TSULayerSaveRestore layerStates](self, "layerStates"), "removeObjectForKey:", a3);
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (TSURetainedPointerKeyDictionary)layerStates
{
  return self->_layerStates;
}

- (void)setLayerStates:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
