@implementation VGMLImageToMultiFloatsModel

- (VGMLImageToMultiFloatsModel)initWithModelInfo:(id)a3
{
  VGMLImageToMultiFloatsModel *v3;
  VGMLImageToMultiFloatsModel *v4;
  VGMLImageToMultiFloatsModel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VGMLImageToMultiFloatsModel;
  v3 = -[VGMLImageToFloatsModel initWithModelInfo:](&v7, sel_initWithModelInfo_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)inferInputImage:(__CVBuffer *)a3 toOutput:(id)a4
{
  void *v6;
  unint64_t i;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (-[VGMLEspressoModel numOutputs](self, "numOutputs"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->super.super._inputBuffers, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bindImage:", a3);

    for (i = 0; i < -[NSMutableArray count](self->super.super._outputBuffers, "count"); ++i)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->super.super._outputBuffers, "objectAtIndexedSubscript:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bindTensor:", v9);

    }
    -[VGMLEspressoModel inferModel](self, "inferModel");
  }

}

@end
