@implementation VGMLImageToFloatsModel

- (VGMLImageToFloatsModel)initWithModelInfo:(id)a3
{
  VGMLImageToFloatsModel *v3;
  VGMLImageToFloatsModel *v4;
  VGMLImageToFloatsModel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VGMLImageToFloatsModel;
  v3 = -[VGMLEspressoModel initWithModelInfo:](&v7, sel_initWithModelInfo_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)inferInputImage:(__CVBuffer *)a3 toOutput:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputBuffers, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindImage:", a3);

  -[NSMutableArray objectAtIndexedSubscript:](self->super._outputBuffers, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindTensor:", v8);

  -[VGMLEspressoModel inferModel](self, "inferModel");
}

@end
