@implementation PUVolumeGlyphView

- (PUVolumeGlyphView)initWithFrame:(CGRect)a3
{
  PUVolumeGlyphView *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *loadingQueue;
  NSObject *v6;
  _QWORD block[4];
  PUVolumeGlyphView *v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PUVolumeGlyphView;
  v3 = -[PUVolumeGlyphView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.PUVolumeGlyphView", 0);
    loadingQueue = v3->_loadingQueue;
    v3->_loadingQueue = (OS_dispatch_queue *)v4;

    objc_initWeak(&location, v3);
    v6 = v3->_loadingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__PUVolumeGlyphView_initWithFrame___block_invoke;
    block[3] = &unk_1E58AB210;
    v9 = v3;
    objc_copyWeak(&v10, &location);
    dispatch_async(v6, block);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)_handleGlyphLayerDidLoad:(id)a3
{
  CALayer **p_glyphLayer;
  id v6;
  CAStateController *v7;
  CAStateController *stateController;
  void *v9;
  void *v10;
  id v11;

  p_glyphLayer = &self->_glyphLayer;
  objc_storeStrong((id *)&self->_glyphLayer, a3);
  v6 = a3;
  v7 = (CAStateController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2868]), "initWithLayer:", v6);
  stateController = self->_stateController;
  self->_stateController = v7;

  -[PUVolumeGlyphView layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSublayer:", v6);

  -[PUVolumeGlyphView setNeedsLayout](self, "setNeedsLayout");
  -[PUVolumeGlyphView stateName](self, "stateName");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CALayer stateWithName:](*p_glyphLayer, "stateWithName:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAStateController setState:ofLayer:](self->_stateController, "setState:ofLayer:", v10, *p_glyphLayer);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUVolumeGlyphView;
  -[PUVolumeGlyphView layoutSubviews](&v3, sel_layoutSubviews);
  -[PUVolumeGlyphView bounds](self, "bounds");
  UIRectGetCenter();
  -[CALayer setPosition:](self->_glyphLayer, "setPosition:");
}

- (void)setStateName:(id)a3
{
  NSString *v4;
  void *v5;
  char v6;
  NSString *v7;
  NSString *stateName;
  double v9;
  NSString *v10;

  v10 = (NSString *)a3;
  v4 = self->_stateName;
  v5 = v10;
  if (v4 == v10)
    goto LABEL_4;
  v6 = -[NSString isEqual:](v10, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSString *)-[NSString copy](v10, "copy");
    stateName = self->_stateName;
    self->_stateName = v7;

    -[CALayer stateWithName:](self->_glyphLayer, "stateWithName:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1.0;
    -[CAStateController setState:ofLayer:transitionSpeed:](self->_stateController, "setState:ofLayer:transitionSpeed:", v5, self->_glyphLayer, v9);
LABEL_4:

  }
}

- (Class)CAMLParser:(id)a3 didFailToFindClassWithName:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "classSubstitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

- (NSString)stateName
{
  return self->_stateName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateName, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_glyphLayer, 0);
}

void __35__PUVolumeGlyphView_initWithFrame___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB34D0], "pu_PhotosUIFrameworkBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("VolumeGlyph"), CFSTR("caml"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD27B8], "parser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 440);
  *(_QWORD *)(v5 + 440) = CFSTR("mute");

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "parseContentsOfURL:", v3);
  objc_msgSend(v4, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __35__PUVolumeGlyphView_initWithFrame___block_invoke_2;
  v9[3] = &unk_1E58AB210;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v11);
}

void __35__PUVolumeGlyphView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleGlyphLayerDidLoad:", *(_QWORD *)(a1 + 32));

}

+ (id)classSubstitions
{
  if (classSubstitions_onceToken != -1)
    dispatch_once(&classSubstitions_onceToken, &__block_literal_global_65280);
  return (id)classSubstitions_substitutions;
}

void __37__PUVolumeGlyphView_classSubstitions__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[11];
  _QWORD v3[12];

  v3[11] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("LKState");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("LKEventHandler");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("LKStateAddAnimation");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("LKStateAddElement");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("LKStateElement");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("LKStateRemoveAnimation");
  v3[5] = objc_opt_class();
  v2[6] = CFSTR("LKStateRemoveElement");
  v3[6] = objc_opt_class();
  v2[7] = CFSTR("LKStateSetValue");
  v3[7] = objc_opt_class();
  v2[8] = CFSTR("LKStateSetProperty");
  v3[8] = objc_opt_class();
  v2[9] = CFSTR("LKStateTransition");
  v3[9] = objc_opt_class();
  v2[10] = CFSTR("LKStateTransitionElement");
  v3[10] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)classSubstitions_substitutions;
  classSubstitions_substitutions = v0;

}

@end
