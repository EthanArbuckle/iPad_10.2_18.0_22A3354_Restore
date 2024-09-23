@implementation VGMLFloatsToFloatsModel

- (void)inferInput:(id)a3 toOutput:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](self->super._inputBuffers, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindTensor:", v9);

  -[NSMutableArray objectAtIndexedSubscript:](self->super._outputBuffers, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bindTensor:", v6);

  -[VGMLEspressoModel inferModel](self, "inferModel");
}

- (const)outputData
{
  void *v2;
  const float *v3;

  -[NSMutableArray objectAtIndexedSubscript:](self->super._outputBuffers, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const float *)objc_msgSend(v2, "getData");

  return v3;
}

@end
