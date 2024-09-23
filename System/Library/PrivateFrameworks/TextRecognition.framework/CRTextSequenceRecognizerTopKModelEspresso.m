@implementation CRTextSequenceRecognizerTopKModelEspresso

- (id)outputNames
{
  return &unk_1E993F740;
}

- (id)outputFromOutputBuffers:()vector<espresso_buffer_t featureInfo:(std:(id)a4 :allocator<espresso_buffer_t>> *)a3
{
  id v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var0;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  CRTextRecognizerTopKModelEspressoOutput *v24;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;

  v6 = a4;
  var0 = a3->var0;
  v8 = *(_OWORD *)((char *)a3->var0 + 120);
  v64 = *(_OWORD *)((char *)a3->var0 + 104);
  v65 = v8;
  v9 = *(_OWORD *)((char *)var0 + 152);
  v66 = *(_OWORD *)((char *)var0 + 136);
  v67 = v9;
  v10 = *(_OWORD *)((char *)var0 + 56);
  v60 = *(_OWORD *)((char *)var0 + 40);
  v61 = v10;
  v11 = *(_OWORD *)((char *)var0 + 88);
  v62 = *(_OWORD *)((char *)var0 + 72);
  v63 = v11;
  v12 = *(_OWORD *)((char *)var0 + 24);
  v58 = *(_OWORD *)((char *)var0 + 8);
  v59 = v12;
  v13 = malloc_type_malloc(*((_QWORD *)var0 + 9), 0x249879DuLL);
  memcpy(v13, *(const void **)a3->var0, *((_QWORD *)a3->var0 + 9));
  v14 = a3->var0;
  v15 = *((_OWORD *)a3->var0 + 18);
  v16 = *((_OWORD *)a3->var0 + 19);
  v17 = *((_OWORD *)a3->var0 + 16);
  v54 = *((_OWORD *)a3->var0 + 17);
  v55 = v15;
  v18 = *((_OWORD *)v14 + 20);
  v56 = v16;
  v57 = v18;
  v19 = *((_OWORD *)v14 + 14);
  v50 = *((_OWORD *)v14 + 13);
  v51 = v19;
  v52 = *((_OWORD *)v14 + 15);
  v53 = v17;
  v20 = *((_OWORD *)v14 + 12);
  v48 = *((_OWORD *)v14 + 11);
  v49 = v20;
  v21 = malloc_type_malloc(*((_QWORD *)v14 + 30), 0xF795E123uLL);
  memcpy(v21, *((const void **)a3->var0 + 21), *((_QWORD *)a3->var0 + 30));
  v22 = objc_msgSend(v6, "count");
  if (-[CRTextSequenceRecognizerModelEspresso engine](self, "engine") == 10007)
  {
    -[CRTextSequenceRecognizerModelEspresso configuration](self, "configuration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v23, "batchSize");

  }
  v44 = v64;
  v45 = v65;
  v46 = v66;
  v47 = v67;
  v40 = v60;
  v41 = v61;
  v42 = v62;
  v43 = v63;
  v38 = v58;
  v39 = v59;
  v33 = v54;
  v34 = v55;
  v35 = v56;
  v36 = v57;
  v29 = v50;
  v30 = v51;
  v31 = v52;
  v32 = v53;
  v27 = v48;
  v37 = v13;
  v26 = v21;
  v28 = v49;
  v24 = -[CRTextRecognizerTopKModelEspressoOutput initWithOutputLabelProbs:outputTopKIndices:featureInfo:batchSize:]([CRTextRecognizerTopKModelEspressoOutput alloc], "initWithOutputLabelProbs:outputTopKIndices:featureInfo:batchSize:", &v37, &v26, v6, v22);

  return v24;
}

@end
