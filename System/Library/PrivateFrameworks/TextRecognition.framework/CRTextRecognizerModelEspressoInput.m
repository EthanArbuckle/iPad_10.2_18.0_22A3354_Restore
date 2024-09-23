@implementation CRTextRecognizerModelEspressoInput

- (CRTextRecognizerModelEspressoInput)initWithImg_input:(vImage_Buffer *)a3 batchSize:(unint64_t)a4 featureInfo:(id)a5
{
  id v8;
  CRTextRecognizerModelEspressoInput *v9;
  CRTextRecognizerModelEspressoInput *v10;
  __int128 v11;
  _OWORD v13[2];
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CRTextRecognizerModelEspressoInput;
  v9 = -[CRTextRecognizerModelEspressoInput init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v11 = *(_OWORD *)&a3->width;
    v13[0] = *(_OWORD *)&a3->data;
    v13[1] = v11;
    -[CRTextRecognizerModelEspressoInput setImg_input:](v9, "setImg_input:", v13);
    -[CRTextRecognizerModelEspressoInput setTextFeatureInfo:](v10, "setTextFeatureInfo:", v8);
    -[CRTextRecognizerModelEspressoInput setBatchSize:](v10, "setBatchSize:", a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;
  void *v4;

  if (self->_img_input.data)
  {
    -[CRTextRecognizerModelEspressoInput img_input](self, "img_input");
    free(v4);
    self->_img_input.data = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CRTextRecognizerModelEspressoInput;
  -[CRTextRecognizerModelEspressoInput dealloc](&v3, sel_dealloc);
}

- (NSArray)textFeatureInfo
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTextFeatureInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (vImage_Buffer)img_input
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].height;
  *(_OWORD *)&retstr->data = *(_OWORD *)&self->rowBytes;
  *(_OWORD *)&retstr->width = v3;
  return self;
}

- (void)setImg_input:(vImage_Buffer *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->data;
  *(_OWORD *)&self->_img_input.width = *(_OWORD *)&a3->width;
  *(_OWORD *)&self->_img_input.data = v3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFeatureInfo, 0);
}

@end
