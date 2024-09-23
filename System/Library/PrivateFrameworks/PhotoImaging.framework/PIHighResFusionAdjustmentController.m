@implementation PIHighResFusionAdjustmentController

- (PIHighResFusionAdjustmentController)initWithAdjustment:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PIHighResFusionAdjustmentController;
  return -[PIAdjustmentController initWithAdjustment:](&v4, sel_initWithAdjustment_, a3);
}

- (NSDictionary)alignment
{
  void *v2;
  void *v3;
  void *v4;

  -[PIAdjustmentController adjustment](self, "adjustment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIHighResFusionAdjustmentController alignmentKey](PIHighResFusionAdjustmentController, "alignmentKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setAlignment:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(a3, "copy");
  -[PIAdjustmentController adjustment](self, "adjustment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIHighResFusionAdjustmentController alignmentKey](PIHighResFusionAdjustmentController, "alignmentKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

- (id)pasteKeysForMediaType:(int64_t)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)alignmentKey
{
  return CFSTR("alignment");
}

@end
