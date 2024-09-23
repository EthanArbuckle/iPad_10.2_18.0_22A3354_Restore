@implementation PBUIImageContainerLayer

+ (id)layer
{
  return objc_alloc_init(PBUIImageContainerLayer);
}

- (PBUIImageContainerLayer)initWithCoder:(id)a3
{
  id v4;
  PBUIImageContainerLayer *v5;
  uint64_t v6;
  CALayer *imageLayer;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBUIImageContainerLayer;
  v5 = -[PBUIImageContainerLayer initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageLayer"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageLayer = v5->_imageLayer;
    v5->_imageLayer = (CALayer *)v6;

    -[PBUIImageContainerLayer addSublayer:](v5, "addSublayer:", v5->_imageLayer);
  }

  return v5;
}

- (id)animationForKey:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PBUIImageContainerLayer;
  v4 = a3;
  -[PBUIImageContainerLayer encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_imageLayer, CFSTR("imageLayer"), v5.receiver, v5.super_class);

}

- (PBUIImageContainerLayer)initWithLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBUIImageContainerLayer;
  return -[PBUIImageContainerLayer initWithLayer:](&v4, sel_initWithLayer_, a3);
}

- (PBUIImageContainerLayer)init
{
  PBUIImageContainerLayer *v2;
  uint64_t v3;
  CALayer *imageLayer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBUIImageContainerLayer;
  v2 = -[PBUIImageContainerLayer init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v3 = objc_claimAutoreleasedReturnValue();
    imageLayer = v2->_imageLayer;
    v2->_imageLayer = (CALayer *)v3;

    -[CALayer setName:](v2->_imageLayer, "setName:", CFSTR("Image Layer"));
    -[CALayer setContentsGravity:](v2->_imageLayer, "setContentsGravity:", *MEMORY[0x1E0CD2F88]);
    -[PBUIImageContainerLayer addSublayer:](v2, "addSublayer:", v2->_imageLayer);
  }
  return v2;
}

- (void)layoutSublayers
{
  CALayer *imageLayer;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CALayer *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PBUIImageContainerLayer;
  -[PBUIImageContainerLayer layoutSublayers](&v14, sel_layoutSublayers);
  imageLayer = self->_imageLayer;
  -[PBUIImageContainerLayer bounds](self, "bounds");
  -[CALayer setFrame:](imageLayer, "setFrame:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PBUIImageContainerLayer sublayers](self, "sublayers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(CALayer **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if (self->_imageLayer != v9)
          -[CALayer layoutSublayers](v9, "layoutSublayers");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setImageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_imageLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLayer, 0);
}

@end
