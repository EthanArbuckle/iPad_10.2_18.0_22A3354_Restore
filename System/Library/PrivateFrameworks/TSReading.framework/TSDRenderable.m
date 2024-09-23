@implementation TSDRenderable

- (TSDRenderable)initWithCALayer:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  TSDRenderable *v13;
  TSDRenderable *v14;
  objc_super v16;

  v5 = a3;
  if ((-[TSDRenderable isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(), "tsd_renderableClass")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDRenderable initWithCALayer:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRenderable.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 30, CFSTR("Wrong renderable class (%@) for layer class (%@)!"), v10, v12);

  }
  v16.receiver = self;
  v16.super_class = (Class)TSDRenderable;
  v13 = -[TSDRenderable init](&v16, sel_init);
  v14 = v13;
  if (v13)
    objc_storeStrong((id *)&v13->_layer, a3);

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  TSDRenderable *v4;
  char v5;

  v4 = (TSDRenderable *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[CALayer isEqual:](self->_layer, "isEqual:", v4->_layer);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[CALayer hash](self->_layer, "hash");
}

+ (id)renderableFromLayer:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "tsd_renderableClass")), "initWithCALayer:", v3);

  return v4;
}

+ (id)renderable
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDE56D0], "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithCALayer:", v3);

  return v4;
}

+ (id)renderablesFromLayers:(id)a3
{
  return (id)objc_msgSend(a3, "tsu_arrayByMappingObjectsUsingBlock:", &__block_literal_global_49);
}

id __39__TSDRenderable_renderablesFromLayers___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[TSDRenderable renderableFromLayer:](TSDRenderable, "renderableFromLayer:", a2);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSDRenderable layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@>"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)addSubrenderable:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[TSDRenderable layer](self, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addSublayer:", v5);
}

- (void)setSubrenderables:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "layer", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    -[TSDRenderable layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSublayers:", v5);

  }
  else
  {
    -[TSDRenderable layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSublayers:", 0);

  }
}

- (NSArray)subrenderables
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSArray *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TSDRenderable layer](self, "layer", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sublayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        +[TSDRenderable renderableFromLayer:](TSDRenderable, "renderableFromLayer:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v3, "count"))
    v11 = v3;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (void)setMaskRenderable:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TSDRenderable layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMask:", v5);

}

- (TSDRenderable)presentationRenderable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TSDRenderable layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TSDRenderable layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentationLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[TSDRenderable renderableFromLayer:](TSDRenderable, "renderableFromLayer:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (TSDRenderable *)v7;
}

- (CALayerDelegate)delegate
{
  void *v2;
  void *v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALayerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TSDRenderable layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (id)contents
{
  void *v2;
  void *v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setContents:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TSDRenderable layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContents:", v4);

}

- (CALayer)superlayer
{
  void *v2;
  void *v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALayer *)v3;
}

- (NSArray)sublayers
{
  void *v2;
  void *v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sublayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setSublayers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TSDRenderable layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSublayers:", v4);

}

- (CGPoint)anchorPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anchorPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[TSDRenderable layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnchorPoint:", x, y);

}

- (CALayer)mask
{
  void *v2;
  void *v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALayer *)v3;
}

- (void)setMask:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TSDRenderable layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMask:", v4);

}

- (BOOL)isHidden
{
  void *v2;
  char v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TSDRenderable layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (float)opacity
{
  void *v2;
  float v3;
  float v4;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "opacity");
  v4 = v3;

  return v4;
}

- (void)setOpacity:(float)a3
{
  double v4;
  id v5;

  -[TSDRenderable layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setOpacity:", v4);

}

- (CGRect)bounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDRenderable layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBounds:", x, y, width, height);

}

- (CGRect)frame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDRenderable layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", x, y, width, height);

}

- (CGPoint)position
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "position");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[TSDRenderable layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPosition:", x, y);

}

- (CGAffineTransform)affineTransform
{
  void *v4;
  CGAffineTransform *result;
  void *v6;

  -[TSDRenderable layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "affineTransform");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (void)setAffineTransform:(CGAffineTransform *)a3
{
  void *v3;
  __int128 v4;

  -[TSDRenderable layer](self, "layer", *(_QWORD *)&a3->a, *(_QWORD *)&a3->b, *(_QWORD *)&a3->c, *(_QWORD *)&a3->d, *(_QWORD *)&a3->tx, *(_QWORD *)&a3->ty);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAffineTransform:", &v4);

}

- (double)contentsScale
{
  void *v2;
  double v3;
  double v4;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsScale");
  v4 = v3;

  return v4;
}

- (void)setContentsScale:(double)a3
{
  id v4;

  -[TSDRenderable layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentsScale:", a3);

}

- (CGColor)backgroundColor
{
  void *v2;
  CGColor *v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGColor *)objc_msgSend(v2, "backgroundColor");

  return v3;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  id v4;

  -[TSDRenderable layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", a3);

}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  -[TSDRenderable layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (unsigned)edgeAntialiasingMask
{
  void *v2;
  unsigned int v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "edgeAntialiasingMask");

  return v3;
}

- (void)setEdgeAntialiasingMask:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[TSDRenderable layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEdgeAntialiasingMask:", v3);

}

- (double)borderWidth
{
  void *v2;
  double v3;
  double v4;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "borderWidth");
  v4 = v3;

  return v4;
}

- (void)setBorderWidth:(double)a3
{
  id v4;

  -[TSDRenderable layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderWidth:", a3);

}

- (CGColor)borderColor
{
  void *v2;
  CGColor *v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGColor *)objc_msgSend(v2, "borderColor");

  return v3;
}

- (void)setBorderColor:(CGColor *)a3
{
  id v4;

  -[TSDRenderable layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderColor:", a3);

}

- (NSString)name
{
  void *v2;
  void *v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TSDRenderable layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v4);

}

- (CGRect)contentsRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setContentsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDRenderable layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentsRect:", x, y, width, height);

}

- (BOOL)allowsGroupOpacity
{
  void *v2;
  char v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsGroupOpacity");

  return v3;
}

- (void)setAllowsGroupOpacity:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TSDRenderable layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupOpacity:", v3);

}

- (BOOL)masksToBounds
{
  void *v2;
  char v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "masksToBounds");

  return v3;
}

- (void)setMasksToBounds:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TSDRenderable layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMasksToBounds:", v3);

}

- (NSString)magnificationFilter
{
  void *v2;
  void *v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "magnificationFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setMagnificationFilter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TSDRenderable layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMagnificationFilter:", v4);

}

- (double)zPosition
{
  void *v2;
  double v3;
  double v4;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "zPosition");
  v4 = v3;

  return v4;
}

- (void)setZPosition:(double)a3
{
  id v4;

  -[TSDRenderable layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setZPosition:", a3);

}

- (NSString)contentsGravity
{
  void *v2;
  void *v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsGravity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setContentsGravity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TSDRenderable layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentsGravity:", v4);

}

- (CGColor)shadowColor
{
  void *v2;
  CGColor *v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGColor *)objc_msgSend(v2, "shadowColor");

  return v3;
}

- (void)setShadowColor:(CGColor *)a3
{
  id v4;

  -[TSDRenderable layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowColor:", a3);

}

- (float)shadowOpacity
{
  void *v2;
  float v3;
  float v4;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowOpacity");
  v4 = v3;

  return v4;
}

- (void)setShadowOpacity:(float)a3
{
  double v4;
  id v5;

  -[TSDRenderable layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setShadowOpacity:", v4);

}

- (CGSize)shadowOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[TSDRenderable layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShadowOffset:", width, height);

}

- (double)shadowRadius
{
  void *v2;
  double v3;
  double v4;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shadowRadius");
  v4 = v3;

  return v4;
}

- (void)setShadowRadius:(double)a3
{
  id v4;

  -[TSDRenderable layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowRadius:", a3);

}

- (CGPath)shadowPath
{
  void *v2;
  CGPath *v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGPath *)objc_msgSend(v2, "shadowPath");

  return v3;
}

- (void)setShadowPath:(CGPath *)a3
{
  id v4;

  -[TSDRenderable layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShadowPath:", a3);

}

- (BOOL)shouldRasterize
{
  void *v2;
  char v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldRasterize");

  return v3;
}

- (void)setShouldRasterize:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TSDRenderable layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldRasterize:", v3);

}

- (double)rasterizationScale
{
  void *v2;
  double v3;
  double v4;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rasterizationScale");
  v4 = v3;

  return v4;
}

- (void)setRasterizationScale:(double)a3
{
  id v4;

  -[TSDRenderable layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRasterizationScale:", a3);

}

- (CGSize)preferredFrameSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredFrameSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)tsd_tilingSafeHasContents
{
  void *v2;
  char v3;

  -[TSDRenderable layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tilingSafeHasContents");

  return v3;
}

- (void)removeFromSuperlayer
{
  id v2;

  -[TSDRenderable layer](self, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperlayer");

}

- (void)setNeedsDisplay
{
  id v2;

  -[TSDRenderable layer](self, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsDisplay");

}

- (void)addSublayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TSDRenderable layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSublayer:", v4);

}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TSDRenderable layer](self, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAnimation:forKey:", v7, v6);

}

- (id)animationForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TSDRenderable layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "animationForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeAnimationForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TSDRenderable layer](self, "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAnimationForKey:", v4);

}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  char v6;

  y = a3.y;
  x = a3.x;
  -[TSDRenderable layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsPoint:", x, y);

  return v6;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromLayer:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[TSDRenderable layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:fromLayer:", v7, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toLayer:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[TSDRenderable layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toLayer:", v7, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)setIfDifferentFrame:(CGRect)a3 orTransform:(CGAffineTransform *)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  __int128 v10;
  _OWORD v11[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDRenderable layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)&a4->c;
  v11[0] = *(_OWORD *)&a4->a;
  v11[1] = v10;
  v11[2] = *(_OWORD *)&a4->tx;
  objc_msgSend(v9, "setIfDifferentFrame:orTransform:", v11, x, y, width, height);

}

- (CALayer)layer
{
  return self->_layer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
