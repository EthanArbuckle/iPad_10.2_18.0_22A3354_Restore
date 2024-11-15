@implementation CRTextRecognizerTopKModelEspressoOutput

- (CRTextRecognizerTopKModelEspressoOutput)initWithOutputLabelProbs:(id *)a3 outputTopKIndices:(id *)a4 featureInfo:(id)a5 batchSize:(unint64_t)a6
{
  id v10;
  CRTextRecognizerTopKModelEspressoOutput *v11;
  CRTextRecognizerTopKModelEspressoOutput *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v24[10];
  uint64_t v25;
  _OWORD v26[10];
  uint64_t v27;
  objc_super v28;

  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)CRTextRecognizerTopKModelEspressoOutput;
  v11 = -[CRTextRecognizerTopKModelEspressoOutput init](&v28, sel_init);
  v12 = v11;
  if (v11)
  {
    v13 = *(_OWORD *)&a3->var12;
    v26[8] = *(_OWORD *)&a3->var10;
    v26[9] = v13;
    v27 = *(_QWORD *)&a3->var14;
    v14 = *(_OWORD *)&a3->var4;
    v26[4] = *(_OWORD *)&a3->var3[2];
    v26[5] = v14;
    v15 = *(_OWORD *)&a3->var8;
    v26[6] = *(_OWORD *)&a3->var6;
    v26[7] = v15;
    v16 = *(_OWORD *)a3->var2;
    v26[0] = *(_OWORD *)&a3->var0;
    v26[1] = v16;
    v17 = *(_OWORD *)a3->var3;
    v26[2] = *(_OWORD *)&a3->var2[2];
    v26[3] = v17;
    -[CRTextRecognizerTopKModelEspressoOutput setOutput_label_prob_map:](v11, "setOutput_label_prob_map:", v26);
    v18 = *(_OWORD *)&a4->var12;
    v24[8] = *(_OWORD *)&a4->var10;
    v24[9] = v18;
    v25 = *(_QWORD *)&a4->var14;
    v19 = *(_OWORD *)&a4->var4;
    v24[4] = *(_OWORD *)&a4->var3[2];
    v24[5] = v19;
    v20 = *(_OWORD *)&a4->var8;
    v24[6] = *(_OWORD *)&a4->var6;
    v24[7] = v20;
    v21 = *(_OWORD *)a4->var2;
    v24[0] = *(_OWORD *)&a4->var0;
    v24[1] = v21;
    v22 = *(_OWORD *)a4->var3;
    v24[2] = *(_OWORD *)&a4->var2[2];
    v24[3] = v22;
    -[CRTextRecognizerTopKModelEspressoOutput setOutput_topk_indices:](v12, "setOutput_topk_indices:", v24);
    -[CRTextRecognizerTopKModelEspressoOutput setTextFeatureInfo:](v12, "setTextFeatureInfo:", v10);
    -[CRTextRecognizerTopKModelEspressoOutput setBatchSize:](v12, "setBatchSize:", a6);
  }

  return v12;
}

- (void)dealloc
{
  void *data;
  void *v4;
  objc_super v5;

  data = self->_output_label_prob_map.data;
  if (data)
  {
    free(data);
    self->_output_label_prob_map.data = 0;
  }
  v4 = self->_output_topk_indices.data;
  if (v4)
  {
    free(v4);
    self->_output_topk_indices.data = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CRTextRecognizerTopKModelEspressoOutput;
  -[CRTextRecognizerTopKModelEspressoOutput dealloc](&v5, sel_dealloc);
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

- ($FD4688982923A924290ECB669CAF1EC2)output_topk_indices
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)&self[2].var0;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[1].var13;
  *(_OWORD *)&retstr->var12 = v3;
  *(_QWORD *)&retstr->var14 = self[2].var2[0];
  v4 = *(_OWORD *)&self[1].var7;
  *(_OWORD *)&retstr->var3[2] = *(_OWORD *)&self[1].var5;
  *(_OWORD *)&retstr->var4 = v4;
  v5 = *(_OWORD *)&self[1].var11;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[1].var9;
  *(_OWORD *)&retstr->var8 = v5;
  v6 = *(_OWORD *)&self[1].var2[3];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var2[1];
  *(_OWORD *)retstr->var2 = v6;
  v7 = *(_OWORD *)&self[1].var3[3];
  *(_OWORD *)&retstr->var2[2] = *(_OWORD *)&self[1].var3[1];
  *(_OWORD *)retstr->var3 = v7;
  return self;
}

- (void)setOutput_topk_indices:(id *)a3
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
  v4 = *(_OWORD *)&a3->var2[2];
  *(_OWORD *)self->_output_topk_indices.dim = *(_OWORD *)a3->var2;
  *(_OWORD *)&self->_output_topk_indices.dim[2] = v4;
  *(_OWORD *)&self->_output_topk_indices.data = v3;
  v5 = *(_OWORD *)a3->var3;
  v6 = *(_OWORD *)&a3->var3[2];
  v7 = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_output_topk_indices.width = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_output_topk_indices.channels = v7;
  *(_OWORD *)self->_output_topk_indices.stride = v5;
  *(_OWORD *)&self->_output_topk_indices.stride[2] = v6;
  v8 = *(_OWORD *)&a3->var8;
  v9 = *(_OWORD *)&a3->var10;
  v10 = *(_OWORD *)&a3->var12;
  *(_QWORD *)&self->_output_topk_indices.storage_type = *(_QWORD *)&a3->var14;
  *(_OWORD *)&self->_output_topk_indices.stride_height = v9;
  *(_OWORD *)&self->_output_topk_indices.stride_batch_number = v10;
  *(_OWORD *)&self->_output_topk_indices.sequence_length = v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFeatureInfo, 0);
}

@end
