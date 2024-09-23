@implementation CRTextRecognizerModelEspressoOutput

- (CRTextRecognizerModelEspressoOutput)initWithOutputLabelProbs:(id *)a3 featureInfo:(id)a4 batchSize:(unint64_t)a5
{
  id v8;
  CRTextRecognizerModelEspressoOutput *v9;
  CRTextRecognizerModelEspressoOutput *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v17[10];
  uint64_t v18;
  objc_super v19;

  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CRTextRecognizerModelEspressoOutput;
  v9 = -[CRTextRecognizerModelEspressoOutput init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    v11 = *(_OWORD *)&a3->var12;
    v17[8] = *(_OWORD *)&a3->var10;
    v17[9] = v11;
    v18 = *(_QWORD *)&a3->var14;
    v12 = *(_OWORD *)&a3->var4;
    v17[4] = *(_OWORD *)&a3->var3[2];
    v17[5] = v12;
    v13 = *(_OWORD *)&a3->var8;
    v17[6] = *(_OWORD *)&a3->var6;
    v17[7] = v13;
    v14 = *(_OWORD *)a3->var2;
    v17[0] = *(_OWORD *)&a3->var0;
    v17[1] = v14;
    v15 = *(_OWORD *)a3->var3;
    v17[2] = *(_OWORD *)&a3->var2[2];
    v17[3] = v15;
    -[CRTextRecognizerModelEspressoOutput setOutput_label_prob_map:](v9, "setOutput_label_prob_map:", v17);
    -[CRTextRecognizerModelEspressoOutput setTextFeatureInfo:](v10, "setTextFeatureInfo:", v8);
    -[CRTextRecognizerModelEspressoOutput setBatchSize:](v10, "setBatchSize:", a5);
  }

  return v10;
}

- (void)dealloc
{
  void *data;
  objc_super v4;

  data = self->_output_label_prob_map.data;
  if (data)
  {
    free(data);
    self->_output_label_prob_map.data = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CRTextRecognizerModelEspressoOutput;
  -[CRTextRecognizerModelEspressoOutput dealloc](&v4, sel_dealloc);
}

- (NSArray)textFeatureInfo
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTextFeatureInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- ($FD4688982923A924290ECB669CAF1EC2)output_label_prob_map
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)&self->var11;
  v4 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self->var13;
  *(_OWORD *)&retstr->var12 = v4;
  *(_QWORD *)&retstr->var14 = self[1].var2[0];
  v5 = *(_OWORD *)&self->var3[3];
  v6 = *(_OWORD *)&self->var7;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self->var5;
  *(_OWORD *)&retstr->var4 = v6;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self->var9;
  *(_OWORD *)&retstr->var8 = v3;
  v7 = *(_OWORD *)&self->var2[3];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var2[1];
  *(_OWORD *)retstr->var2 = v7;
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self->var3[1];
  *(_OWORD *)retstr->var3 = v5;
  return self;
}

- (void)setOutput_label_prob_map:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)a3->var2;
  *(_OWORD *)&self->_output_label_prob_map.dim[2] = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)self->_output_label_prob_map.dim = v4;
  *(_OWORD *)&self->_output_label_prob_map.data = v3;
  v5 = *(_OWORD *)a3->var3;
  v6 = *(_OWORD *)&a3->var3[2];
  v7 = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_output_label_prob_map.channels = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_output_label_prob_map.width = v7;
  *(_OWORD *)&self->_output_label_prob_map.stride[2] = v6;
  *(_OWORD *)self->_output_label_prob_map.stride = v5;
  v8 = *(_OWORD *)&a3->var8;
  v9 = *(_OWORD *)&a3->var10;
  v10 = *(_OWORD *)&a3->var12;
  *(_QWORD *)&self->_output_label_prob_map.storage_type = *(_QWORD *)&a3->var14;
  *(_OWORD *)&self->_output_label_prob_map.stride_batch_number = v10;
  *(_OWORD *)&self->_output_label_prob_map.stride_height = v9;
  *(_OWORD *)&self->_output_label_prob_map.sequence_length = v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFeatureInfo, 0);
}

@end
