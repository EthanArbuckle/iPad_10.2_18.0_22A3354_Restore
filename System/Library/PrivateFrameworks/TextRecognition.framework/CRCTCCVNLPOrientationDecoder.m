@implementation CRCTCCVNLPOrientationDecoder

- (CRCTCCVNLPOrientationDecoder)initWithConfiguration:(id)a3 model:(id)a4 error:(id *)a5
{
  CRCTCCVNLPOrientationDecoder *v8;
  CRCTCCVNLPOrientationDecoder *v9;
  id *p_model;
  int *v11;
  uint64_t v12;
  NSOrderedSet *characterObservations;
  void **p_begin;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t value;
  uint64_t *end;
  unint64_t *v23;
  uint64_t *begin;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t *v30;
  uint64_t v31;
  CRCTCCVNLPOrientationDecoder *v32;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v36 = a4;
  v41.receiver = self;
  v41.super_class = (Class)CRCTCCVNLPOrientationDecoder;
  v8 = -[CRCTCCVNLPOrientationDecoder init](&v41, sel_init);
  v9 = v8;
  if (!v8)
  {
LABEL_30:
    v32 = v9;
    goto LABEL_31;
  }
  p_model = (id *)&v8->_model;
  objc_storeStrong((id *)&v8->_model, a4);
  v11 = (int *)objc_msgSend(*p_model, "codemapArray");
  if (v11)
  {
    unicodeArrayToNSStringArray(v11, objc_msgSend(*p_model, "codemapSize"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:");
    v12 = objc_claimAutoreleasedReturnValue();
    characterObservations = v9->_characterObservations;
    v9->_characterObservations = (NSOrderedSet *)v12;

    if (-[CRCTCCVNLPOrientationDecoder shouldUseModernizedDecoder](v9, "shouldUseModernizedDecoder"))
    {
      p_begin = (void **)&v9->_spaceLabels.__begin_;
      v9->_spaceLabels.__end_ = v9->_spaceLabels.__begin_;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v15 = objc_msgSend(&unk_1E993F938, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v38 != v16)
              objc_enumerationMutation(&unk_1E993F938);
            v18 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
            -[CRCTCCVNLPOrientationDecoder characterObservations](v9, "characterObservations");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "indexOfObject:", v18);

            if (v20 != 0x7FFFFFFFFFFFFFFFLL)
            {
              end = (uint64_t *)v9->_spaceLabels.__end_;
              value = (unint64_t)v9->_spaceLabels.__end_cap_.__value_;
              if ((unint64_t)end >= value)
              {
                begin = (uint64_t *)*p_begin;
                v25 = ((char *)end - (_BYTE *)*p_begin) >> 3;
                v26 = v25 + 1;
                if ((unint64_t)(v25 + 1) >> 61)
                  std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
                v27 = value - (_QWORD)begin;
                if (v27 >> 2 > v26)
                  v26 = v27 >> 2;
                if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8)
                  v28 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v28 = v26;
                if (v28)
                {
                  v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v9->_spaceLabels.__end_cap_, v28);
                  begin = (uint64_t *)v9->_spaceLabels.__begin_;
                  end = (uint64_t *)v9->_spaceLabels.__end_;
                }
                else
                {
                  v29 = 0;
                }
                v30 = (uint64_t *)&v29[8 * v25];
                *v30 = v20;
                v23 = (unint64_t *)(v30 + 1);
                while (end != begin)
                {
                  v31 = *--end;
                  *--v30 = v31;
                }
                v9->_spaceLabels.__begin_ = (unint64_t *)v30;
                v9->_spaceLabels.__end_ = v23;
                v9->_spaceLabels.__end_cap_.__value_ = (unint64_t *)&v29[8 * v28];
                if (begin)
                  operator delete(begin);
              }
              else
              {
                *end = v20;
                v23 = (unint64_t *)(end + 1);
              }
              v9->_spaceLabels.__end_ = v23;
            }
          }
          v15 = objc_msgSend(&unk_1E993F938, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v15);
      }
    }

    goto LABEL_30;
  }
  if (a5)
  {
    +[CRImageReader errorWithErrorCode:](CRImageReader, "errorWithErrorCode:", -8);
    v32 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
LABEL_31:

  return v32;
}

- (BOOL)shouldDecodeWithLM
{
  return 0;
}

- (BOOL)shouldUseModernizedDecoder
{
  void *v2;
  void *v3;
  BOOL v4;

  -[CRCTCCVNLPOrientationDecoder model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputFormatVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue") == 2;

  return v4;
}

- (BOOL)decodeOutput:(id)a3 imageSize:(CGSize)a4 error:(id *)a5
{
  return 0;
}

- (BOOL)decodeOutput:(id)a3 imageSize:(CGSize)a4 shouldDecodeScriptResult:(BOOL)a5 shouldDecodeOrientationResult:(BOOL)a6 shouldDecodeLayoutDirectionResult:(BOOL)a7 error:(id *)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  BOOL v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void *v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[5];
  void *v34;
  uint64_t v35;
  void *v36;
  char v37;
  void *__p;
  void *v39;
  uint64_t v40;
  CFTypeRef v41[3];
  CFTypeRef cf;
  __int128 v43;
  void **v44;
  __int128 v45;
  void *v46;
  uint64_t v47;
  void *v48;
  _BYTE *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  char v54;
  void *v55;
  _BYTE *v56;
  uint64_t v57;
  CFTypeRef *v58;

  v8 = a7;
  v9 = a6;
  v10 = a5;
  v12 = a3;
  if (-[CRCTCCVNLPOrientationDecoder shouldUseModernizedDecoder](self, "shouldUseModernizedDecoder"))
  {
    -[CRCTCCVNLPOrientationDecoder model](self, "model");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "ctcBlankLabelIndex");

    LOBYTE(v47) = 0;
    v46 = &unk_1E98D9098;
    v49 = 0;
    v50 = 0;
    v48 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v48, self->_spaceLabels.__begin_, (uint64_t)self->_spaceLabels.__end_, self->_spaceLabels.__end_ - self->_spaceLabels.__begin_);
    v51 = &unk_1E98D8E40;
    v52 = v14;
    v54 = 0;
    v53 = &unk_1E98D9098;
    v56 = 0;
    v57 = 0;
    v55 = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&v55, v48, (uint64_t)v49, (v49 - (_BYTE *)v48) >> 3);
    v46 = &unk_1E98D9098;
    if (v48)
    {
      v49 = v48;
      operator delete(v48);
    }
    -[CRCTCCVNLPOrientationDecoder _buildModernizedActivationMatrices:](self, "_buildModernizedActivationMatrices:", v12);
    v44 = 0;
    v45 = 0uLL;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3321888768;
    v33[2] = __150__CRCTCCVNLPOrientationDecoder_decodeOutput_imageSize_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult_error___block_invoke;
    v33[3] = &unk_1E98D86B0;
    v34 = &unk_1E98D8E40;
    v35 = v52;
    v37 = v54;
    v36 = &unk_1E98D9098;
    v39 = 0;
    v40 = 0;
    __p = 0;
    std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(&__p, v55, (uint64_t)v56, (v56 - (_BYTE *)v55) >> 3);
    memset(v41, 0, sizeof(v41));
    std::vector<CoreRecognition::decoder::ActivationMatrix>::__init_with_size[abi:ne180100]<CoreRecognition::decoder::ActivationMatrix*,CoreRecognition::decoder::ActivationMatrix*>(v41, (uint64_t)v46, v47, 0xCCCCCCCCCCCCCCCDLL * ((v47 - (uint64_t)v46) >> 4));
    v43 = v45;
    cf = 0;
    v33[4] = self;
    v15 = (void *)MEMORY[0x1D826E9A8](v33);
    if (cf)
      CFRelease(cf);
    v58 = v41;
    std::vector<CoreRecognition::decoder::ActivationMatrix>::__destroy_vector::operator()[abi:ne180100]((void ***)&v58);
    v34 = &unk_1E98D8E40;
    v36 = &unk_1E98D9098;
    if (__p)
    {
      v39 = __p;
      operator delete(__p);
    }
    v44 = &v46;
    std::vector<CoreRecognition::decoder::ActivationMatrix>::__destroy_vector::operator()[abi:ne180100](&v44);
    v51 = &unk_1E98D8E40;
    v53 = &unk_1E98D9098;
    if (v55)
    {
      v56 = v55;
      operator delete(v55);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D09AE8], "defaultWhitespaceCommitActionBehavior");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09AE8]), "initWithCommitActionBehavior:", v16);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D09AB8]), "initWithLanguageResourceBundle:", 0);
    -[CRCTCCVNLPOrientationDecoder _buildActivationMatrices:](self, "_buildActivationMatrices:", v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __150__CRCTCCVNLPOrientationDecoder_decodeOutput_imageSize_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult_error___block_invoke_8;
    v29 = &unk_1E98DBCA8;
    v30 = v18;
    v31 = v19;
    v32 = v17;
    v20 = v17;
    v21 = v19;
    v22 = v18;
    v15 = (void *)MEMORY[0x1D826E9A8](&v26);

  }
  objc_msgSend(v12, "textFeatureInfo", v26, v27, v28, v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[CRCTCCVNLPOrientationDecoder _decodeFeaturesWithInfo:decoderCallback:shouldDecodeScriptResult:shouldDecodeOrientationResult:shouldDecodeLayoutDirectionResult:](self, "_decodeFeaturesWithInfo:decoderCallback:shouldDecodeScriptResult:shouldDecodeOrientationResult:shouldDecodeLayoutDirectionResult:", v23, v15, v10, v9, v8);

  return v24;
}

id __150__CRCTCCVNLPOrientationDecoder_decodeOutput_imageSize_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v4[3];
  void **v5;

  CoreRecognition::decoder::CTCGreedyDecoder<CoreRecognition::decoder::SpaceSegmentedPathBuilder<CoreRecognition::decoder::BaseState>>::decode((_QWORD *)(a1 + 40), (uint64_t *)(*(_QWORD *)(a1 + 96) + 80 * a2), v4);
  convertToCVNLPTextDecodingResult();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void **)v4;
  std::vector<CoreRecognition::decoder::DecodingPath>::__destroy_vector::operator()[abi:ne180100](&v5);
  return v2;
}

id __150__CRCTCCVNLPOrientationDecoder_decodeOutput_imageSize_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "characterObservations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __150__CRCTCCVNLPOrientationDecoder_decodeOutput_imageSize_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult_error___block_invoke_8(uint64_t a1, uint64_t a2)
{
  void *v3;

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setActivationMatrix:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "greedyDecodingResultWithConfiguration:", *(_QWORD *)(a1 + 48));
}

- (id)_buildActivationMatrices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  __int128 v28;
  uint64_t v29;
  _OWORD v30[10];
  uint64_t v31;
  char *v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v4, "textFeatureInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRCTCCVNLPOrientationDecoder model](self, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "codemapSize");

  v34 = 0;
  v35 = v8;
  v32 = 0;
  v33 = 0;
  -[CRCTCCVNLPOrientationDecoder _create2DArraysFromInputArray:classSize:outputArrays:](self, "_create2DArraysFromInputArray:classSize:outputArrays:", v4, &v35, &v32);
  -[CRCTCCVNLPOrientationDecoder model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "ctcBlankLabelIndex");

  v11 = v32;
  if (v33 != v32)
  {
    v12 = 0;
    v13 = 0;
    do
    {
      v14 = objc_alloc(MEMORY[0x1E0D09AB0]);
      v15 = *(_OWORD *)&v11[v12];
      v16 = *(_OWORD *)&v11[v12 + 32];
      v30[1] = *(_OWORD *)&v11[v12 + 16];
      v30[2] = v16;
      v30[0] = v15;
      v17 = *(_OWORD *)&v11[v12 + 48];
      v18 = *(_OWORD *)&v11[v12 + 64];
      v19 = *(_OWORD *)&v11[v12 + 96];
      v30[5] = *(_OWORD *)&v11[v12 + 80];
      v30[6] = v19;
      v30[3] = v17;
      v30[4] = v18;
      v20 = *(_OWORD *)&v11[v12 + 112];
      v21 = *(_OWORD *)&v11[v12 + 128];
      v22 = *(_OWORD *)&v11[v12 + 144];
      v31 = *(_QWORD *)&v11[v12 + 160];
      v30[8] = v21;
      v30[9] = v22;
      v30[7] = v20;
      -[CRCTCCVNLPOrientationDecoder characterObservations](self, "characterObservations");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = xmmword_1D513B738;
      v29 = 10;
      v24 = (void *)objc_msgSend(v14, "initWithBuffer:domainType:characterObservations:blankIndex:pruningPolicy:", v30, 0, v23, v10, &v28);

      objc_msgSend(v27, "addObject:", v24);
      ++v13;
      v11 = v32;
      v12 += 168;
    }
    while (v13 < 0xCF3CF3CF3CF3CF3DLL * ((v33 - v32) >> 3));
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = v32;
    operator delete(v32);
  }

  return v25;
}

- (vector<CoreRecognition::decoder::ActivationMatrix,)_buildModernizedActivationMatrices:(CRCTCCVNLPOrientationDecoder *)self
{
  id v6;
  void *v7;
  unint64_t v8;
  __compressed_pair<CoreRecognition::decoder::ActivationMatrix *, std::allocator<CoreRecognition::decoder::ActivationMatrix>> *p_var2;
  ActivationMatrix *var0;
  ActivationMatrix *var1;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  ActivationMatrix *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  vector<CoreRecognition::decoder::ActivationMatrix, std::allocator<CoreRecognition::decoder::ActivationMatrix>> *result;
  void *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  __compressed_pair<CoreRecognition::decoder::ActivationMatrix *, std::allocator<CoreRecognition::decoder::ActivationMatrix>> *v39;

  v6 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v30 = v6;
  objc_msgSend(v6, "textFeatureInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  p_var2 = &retstr->var2;
  var0 = retstr->var0;
  if (0xCCCCCCCCCCCCCCCDLL * ((retstr->var2.var0 - retstr->var0) >> 4) < v8)
  {
    if (v8 > 0x333333333333333)
      std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
    var1 = retstr->var1;
    v39 = &retstr->var2;
    v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreRecognition::decoder::ActivationMatrix>>(v8);
    v36 = &v35[var1 - var0];
    v37 = v36;
    v38 = &v35[80 * v12];
    std::vector<CoreRecognition::decoder::ActivationMatrix>::__swap_out_circular_buffer((uint64_t *)retstr, &v35);
    std::__split_buffer<CoreRecognition::decoder::ActivationMatrix>::~__split_buffer((uint64_t)&v35);
  }

  -[CRCTCCVNLPOrientationDecoder model](self, "model");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "codemapSize");

  v33 = 0;
  v34 = v14;
  v31 = 0;
  v32 = 0;
  -[CRCTCCVNLPOrientationDecoder _create2DArraysFromInputArray:classSize:outputArrays:](self, "_create2DArraysFromInputArray:classSize:outputArrays:", v6, &v34, &v31);
  v15 = v31;
  v16 = v32;
  if (v32 == v31)
  {
    v15 = v32;
    if (!v32)
      goto LABEL_18;
    goto LABEL_17;
  }
  v17 = 0;
  v18 = 0;
  v19 = retstr->var1;
  do
  {
    v20 = *(_QWORD *)&v15[v17 + 96];
    v21 = *(_QWORD *)&v15[v17 + 112];
    v22 = *(_QWORD *)&v15[v17];
    if (v19 >= p_var2->var0)
    {
      v23 = 0xCCCCCCCCCCCCCCCDLL * ((v19 - retstr->var0) >> 4);
      v24 = v23 + 1;
      if (v23 + 1 > 0x333333333333333)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      if (0x999999999999999ALL * ((p_var2->var0 - retstr->var0) >> 4) > v24)
        v24 = 0x999999999999999ALL * ((p_var2->var0 - retstr->var0) >> 4);
      if (0xCCCCCCCCCCCCCCCDLL * ((p_var2->var0 - retstr->var0) >> 4) >= 0x199999999999999)
        v25 = 0x333333333333333;
      else
        v25 = v24;
      v39 = &retstr->var2;
      v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CoreRecognition::decoder::ActivationMatrix>>(v25);
      v27 = &v26[80 * v23];
      v35 = v26;
      v36 = v27;
      v38 = &v26[80 * v28];
      *(_QWORD *)v27 = v21;
      *((_QWORD *)v27 + 1) = v20;
      *((_OWORD *)v27 + 1) = 0u;
      *((_OWORD *)v27 + 2) = 0u;
      *((_OWORD *)v27 + 3) = 0u;
      *((_QWORD *)v27 + 8) = v22;
      *((_QWORD *)v27 + 9) = 0;
      v37 = v27 + 80;
      std::vector<CoreRecognition::decoder::ActivationMatrix>::__swap_out_circular_buffer((uint64_t *)retstr, &v35);
      v19 = retstr->var1;
      std::__split_buffer<CoreRecognition::decoder::ActivationMatrix>::~__split_buffer((uint64_t)&v35);
      v15 = v31;
      v16 = v32;
    }
    else
    {
      *(_QWORD *)v19 = v21;
      *((_QWORD *)v19 + 1) = v20;
      *((_OWORD *)v19 + 1) = 0u;
      *((_OWORD *)v19 + 2) = 0u;
      *((_OWORD *)v19 + 3) = 0u;
      *((_QWORD *)v19 + 8) = v22;
      *((_QWORD *)v19 + 9) = 0;
      v19 = (ActivationMatrix *)((char *)v19 + 80);
    }
    retstr->var1 = v19;
    ++v18;
    v17 += 168;
  }
  while (v18 < 0xCF3CF3CF3CF3CF3DLL * ((v16 - v15) >> 3));
  if (v15)
  {
LABEL_17:
    v32 = v15;
    operator delete(v15);
  }
LABEL_18:

  return result;
}

- (void)_create2DArraysFromInputArray:(id)a3 classSize:(unint64_t *)a4 outputArrays:(void *)a5
{
  float *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  float v17;
  float *v18;
  double v19;
  float v20;
  void *v21;
  void *v22;
  float v23;
  float v24;
  void *v25;
  void *v26;
  float v27;
  float v28;
  double v29;
  unint64_t v30;
  void *v31;
  void *v32;
  BOOL v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  float *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  unint64_t v46;
  float *v47;
  void *v48;
  uint64_t v49;
  _DWORD *v50;
  void *v51;
  float *v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v60;
  float *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  float *v70;
  void *v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  float *v88;
  uint64_t v89;
  int v90;

  v7 = a3;
  v51 = v7;
  if (v7)
  {
    objc_msgSend(v7, "output_label_prob_map");
    v52 = (float *)v78;
    v8 = v83;
    v64 = v82;
    v65 = v80;
    v63 = v84;
    v57 = v85;
    v58 = v86;
    v56 = v87;
    v60 = v81;
    v61 = v88;
    v54 = *((_QWORD *)&v78 + 1);
    v55 = v89;
    v53 = v90;
  }
  else
  {
    v53 = 0;
    v55 = 0;
    v56 = 0;
    v60 = 0;
    v61 = 0;
    v57 = 0;
    v58 = 0;
    v63 = 0;
    v64 = 0;
    v8 = 0;
    v65 = 0;
    v54 = 0;
    v52 = 0;
  }
  objc_msgSend(v51, "textFeatureInfo");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRCTCCVNLPOrientationDecoder model](self, "model");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "outputFormatVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue") == 1;

  v62 = (uint64_t)v61;
  if ((v11 & 1) == 0)
  {
    -[CRCTCCVNLPOrientationDecoder model](self, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "outputFormatVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue") == 2;

    if ((_DWORD)v11)
      v13 = v60;
    else
      v13 = 1;
    v14 = v58;
    if (!(_DWORD)v11)
      v14 = 1;
    v62 = v14;
    v63 = v13;
  }
  std::vector<espresso_buffer_t>::resize((uint64_t)a5, objc_msgSend(v71, "count"));
  if (-[CRCTCCVNLPOrientationDecoder shouldUseModernizedDecoder](self, "shouldUseModernizedDecoder"))
  {
    v15 = v64 * v8 * v60 * v65;
    if (v15)
    {
      v8 = 4 * v15;
      v11 = 4286578688;
      v5 = v52;
      do
      {
        v16 = *v5;
        v17 = logf(*v5);
        if (v16 <= 0.0)
          v17 = -INFINITY;
        *v5++ = v17;
        v8 -= 4;
      }
      while (v8);
    }
  }
  v73 = 0;
  v74 = 0;
  v72 = 160;
  while (v74 < objc_msgSend(v71, "count"))
  {
    objc_msgSend(v71, "objectAtIndexedSubscript:");
    v18 = (float *)objc_claimAutoreleasedReturnValue();
    v19 = -[CRFeatureSequenceRecognitionInfo featureImageSize]((uint64_t)v18);
    if (v18)
      v20 = v18[2];
    else
      v20 = 0.0;
    -[CRCTCCVNLPOrientationDecoder model](self, "model");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "outputWidthDownscale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "floatValue");
    v24 = v23;
    -[CRCTCCVNLPOrientationDecoder model](self, "model");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "outputWidthOffset");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "floatValue");
    v28 = v27;

    v29 = ceil(v19 * v20 / v24) + v28 + 2.0;
    if (v63 >= (unint64_t)v29)
      v30 = (unint64_t)v29;
    else
      v30 = v63;
    -[CRCTCCVNLPOrientationDecoder model](self, "model");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "outputFormatVersion");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "intValue") == 1;

    v34 = v73;
    v36 = v64;
    v35 = v65;
    v37 = v60;
    v38 = v61;
    v39 = v57;
    v40 = v58;
    v41 = v55;
    v42 = v56;
    if (!v33)
    {
      -[CRCTCCVNLPOrientationDecoder model](self, "model", v64, v61, v55);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "outputFormatVersion");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "intValue") == 2;

      v37 = v68;
      v35 = v69;
      v46 = v66;
      v36 = v67;
      v47 = v70;
      v48 = v10;
      v49 = v8;
      v42 = v6;
      v38 = v5;
      v41 = v11;
      if (!v45)
        goto LABEL_28;
      v38 = (float *)(v63 * v65);
      v34 = v62 * v63 * v74;
      v37 = v64;
      v41 = v65;
      v35 = v64;
      v36 = v65;
      v39 = 1;
      v40 = 1;
      v42 = 1;
    }
    v78 = 0u;
    v79 = 0u;
    v46 = v30;
    v48 = (void *)v39;
    v49 = v40;
    v76 = 0u;
    v77 = 0u;
    v47 = &v52[v34];
LABEL_28:
    v50 = (_DWORD *)(*(_QWORD *)a5 + v72);
    v69 = v35;
    v70 = v47;
    *((_QWORD *)v50 - 20) = v47;
    *((_QWORD *)v50 - 19) = v54;
    *((_OWORD *)v50 - 9) = v78;
    *((_OWORD *)v50 - 8) = v79;
    *((_OWORD *)v50 - 7) = v76;
    *((_OWORD *)v50 - 6) = v77;
    *((_QWORD *)v50 - 10) = v35;
    *((_QWORD *)v50 - 9) = v37;
    v67 = v36;
    v68 = v37;
    *((_QWORD *)v50 - 8) = v36;
    *((_QWORD *)v50 - 7) = 1;
    v66 = v46;
    *((_QWORD *)v50 - 6) = v46;
    *((_QWORD *)v50 - 5) = v48;
    v10 = v48;
    v8 = v49;
    *((_QWORD *)v50 - 4) = v49;
    *((_QWORD *)v50 - 3) = v42;
    v6 = v42;
    v5 = v38;
    *((_QWORD *)v50 - 2) = v38;
    *((_QWORD *)v50 - 1) = v41;
    v11 = v41;
    *v50 = v53;

    v73 += v62;
    ++v74;
    v72 += 168;
  }

}

- (BOOL)_decodeFeaturesWithInfo:(id)a3 decoderCallback:(id)a4 shouldDecodeScriptResult:(BOOL)a5 shouldDecodeOrientationResult:(BOOL)a6 shouldDecodeLayoutDirectionResult:(BOOL)a7
{
  void *v9;
  void *v10;
  void *v11;
  double *v12;
  double v13;
  int v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  SEL v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  const char *v41;
  int v42;
  int v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  BOOL v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  _BOOL4 v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  BOOL v67;
  const char *v68;
  void *v69;
  double *v70;
  uint64_t v71;
  double *v72;
  uint64_t v73;
  uint64_t k;
  void *v75;
  void *v76;
  BOOL v77;
  const char *v78;
  void *v79;
  void *v80;
  BOOL v81;
  BOOL v82;
  BOOL v83;
  const char *v84;
  id Property;
  id v86;
  _BOOL4 v87;
  id v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  double *v93;
  id v94;
  id v95;
  BOOL v96;
  id v97;
  id v98;
  unint64_t v99;
  uint64_t v100;
  void *v102;
  void *v103;
  void *v104;
  _BOOL4 v105;
  _BOOL4 v106;
  CRCTCCVNLPOrientationDecoder *v107;
  _BOOL4 v108;
  uint64_t v109;
  void (**v110)(id, _QWORD);
  id v111;
  void *context;
  void *v113;
  unint64_t v114;
  void *v115;
  id newValue;
  unint64_t v117;
  id obj;
  id v119;
  void *v120;
  double *selfa;
  void *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _QWORD v135[4];
  id v136;
  _QWORD v137[4];
  id v138;
  _QWORD v139[6];
  _QWORD v140[6];
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t v148;
  _QWORD block[5];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  uint64_t v153;

  v105 = a5;
  v106 = a7;
  v108 = a6;
  v153 = *MEMORY[0x1E0C80C00];
  v111 = a3;
  v110 = (void (**)(id, _QWORD))a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke;
  block[3] = &unk_1E98DB338;
  v107 = self;
  block[4] = self;
  if (qword_1ED0B48C8 != -1)
    dispatch_once(&qword_1ED0B48C8, block);
  v117 = 0;
  v109 = 0;
LABEL_4:
  v114 = objc_msgSend(v111, "count");
  if (v117 < v114)
  {
    context = (void *)MEMORY[0x1D826E7B0]();
    v110[2](v110, v117);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = v9;
    if (!v9)
    {
      v14 = 1;
      goto LABEL_108;
    }
    objc_msgSend(v111, "objectAtIndexedSubscript:", v117);
    selfa = (double *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v115, "fullString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = selfa;
    newValue = v11;
    if (!v108)
    {
LABEL_26:
      if (v106)
      {
        v145 = 0;
        v146 = &v145;
        v147 = 0x2020000000;
        v148 = 0;
        v141 = 0;
        v142 = &v141;
        v143 = 0x2020000000;
        v144 = 0;
        v29 = objc_msgSend(v11, "length");
        v139[0] = MEMORY[0x1E0C809B0];
        v139[1] = 3221225472;
        v139[2] = __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_3;
        v139[3] = &unk_1E98DAA58;
        v139[4] = &v145;
        v139[5] = &v141;
        objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", 0, v29, 2, v139);
        if (v12)
        {
          v30 = v142[3];
          v31 = v30 <= v146[3] || v30 <= 1;
          v32 = 5;
          if (v31)
            v32 = 1;
          *((_QWORD *)v12 + 9) = v32;
        }
        _Block_object_dispose(&v141, 8);
        _Block_object_dispose(&v145, 8);
      }
      if (!v105
        || (-[CRTextSequenceRecognizerModel configuration](v107->_model, "configuration"),
            v33 = (void *)objc_claimAutoreleasedReturnValue(),
            v34 = objc_msgSend(v33, "scriptDetectionDisabled"),
            v33,
            (v34 & 1) != 0))
      {
        v14 = 0;
        goto LABEL_107;
      }
      if (qword_1ED0B48D8)
      {
        objc_msgSend((id)qword_1ED0B48D8, "stringByReplacingMatchesInString:options:range:withTemplate:", newValue, 0, 0, objc_msgSend(newValue, "length"), &stru_1E98DC948);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v35, "length"))
        {
          objc_msgSend(newValue, "uppercaseString");
          v36 = objc_claimAutoreleasedReturnValue();

          v35 = (void *)v36;
        }
      }
      else
      {
        objc_msgSend(newValue, "uppercaseString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      for (i = 0; i != 7; ++i)
      {
        objc_msgSend((id)qword_1ED0B48C0, "objectAtIndexedSubscript:", i);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)qword_1ED0B48B8, "objectAtIndexedSubscript:", i);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringByReplacingOccurrencesOfString:withString:", v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = v40;
      }
      if (v40)
      {
        if (objc_msgSend(v40, "length"))
        {
          if (selfa)
            objc_setProperty_atomic(selfa, v41, newValue, 56);
          v42 = objc_msgSend(v40, "containsString:", CFSTR("L"));
          if (qword_1ED0B48D0)
            v43 = v42;
          else
            v43 = 0;
          if (v43 == 1)
          {
            objc_msgSend((id)qword_1ED0B48D0, "stringByReplacingMatchesInString:options:range:withTemplate:", v40, 0, 0, objc_msgSend(v40, "length"), CFSTR("L"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v44 = v40;
          }
          v103 = (void *)objc_opt_new();
          v102 = v44;
          v45 = objc_msgSend(v44, "length");
          v137[0] = MEMORY[0x1E0C809B0];
          v137[1] = 3221225472;
          v137[2] = __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_4;
          v137[3] = &unk_1E98DBCD0;
          v46 = v103;
          v138 = v46;
          objc_msgSend(v44, "enumerateSubstringsInRange:options:usingBlock:", 0, v45, 2, v137);
          objc_msgSend(v46, "allObjects");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v135[0] = MEMORY[0x1E0C809B0];
          v135[1] = 3221225472;
          v135[2] = __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_5;
          v135[3] = &unk_1E98DBCF8;
          v119 = v46;
          v136 = v119;
          objc_msgSend(v47, "sortedArrayUsingComparator:", v135);
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          v122 = (void *)objc_opt_new();
          v133 = 0u;
          v134 = 0u;
          v131 = 0u;
          v132 = 0u;
          +[CRScriptCategoryV1 supportedCategories](CRScriptCategoryV1, "supportedCategories");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = 0;
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v131, v152, 16);
          if (v50)
          {
            v51 = *(_QWORD *)v132;
            do
            {
              for (j = 0; j != v50; ++j)
              {
                if (*(_QWORD *)v132 != v51)
                  objc_enumerationMutation(v48);
                v53 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * j);
                +[CRScriptCategoryV1 unknown]();
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = v53 == v54;

                if (!v55)
                {
                  +[CRScriptCategoryV1 sequenceScriptForCategory:](CRScriptCategoryV1, "sequenceScriptForCategory:", v53);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  v57 = objc_msgSend(v119, "countForObject:", v56);

                  +[CRScriptCategoryV1 latinCyrillic]();
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v53 == v58)
                  {

                  }
                  else
                  {
                    +[CRScriptCategoryV1 common]();
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    v61 = v53 != v59 && v57 > v49;

                    if (v61)
                      v49 = v57;
                  }
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v57);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v122, "setObject:forKeyedSubscript:", v62, v53);

                }
              }
              v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v131, v152, 16);
            }
            while (v50);
          }

          objc_msgSend(v104, "objectAtIndexedSubscript:", 0);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          +[CRScriptCategoryV1 latinCyrillic]();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "objectForKeyedSubscript:", v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if ((int)objc_msgSend(v64, "intValue") <= 0)
          {

          }
          else
          {
            +[CRScriptCategoryV1 latinCyrillic]();
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "objectForKeyedSubscript:", v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = (double)v49 + (double)v49 > (double)(int)objc_msgSend(v66, "intValue");

            if (!v67)
            {
              +[CRScriptCategoryV1 latinCyrillic]();
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = selfa;
              if (selfa)
                goto LABEL_103;
              goto LABEL_104;
            }
          }
          v129 = 0u;
          v130 = 0u;
          v127 = 0u;
          v128 = 0u;
          obj = (id)qword_1ED0B48E0;
          v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v151, 16);
          v72 = selfa;
          if (!v71)
            goto LABEL_96;
          v73 = *(_QWORD *)v128;
          while (1)
          {
            for (k = 0; k != v71; ++k)
            {
              if (*(_QWORD *)v128 != v73)
                objc_enumerationMutation(obj);
              v75 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * k);
              +[CRScriptCategoryV1 sequenceScriptForCategory:](CRScriptCategoryV1, "sequenceScriptForCategory:", v75);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v120, "isEqualToString:", v76))
              {
                v77 = v72 == 0;

                v72 = selfa;
                if (!v77)
                  goto LABEL_92;
              }
              else
              {
                objc_msgSend(v122, "objectForKeyedSubscript:", v75);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                if ((int)objc_msgSend(v79, "intValue") > 0)
                {
                  objc_msgSend(v122, "objectForKeyedSubscript:", v75);
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  v81 = v72 == 0;
                  v82 = v49 != (int)objc_msgSend(v80, "intValue");

                  v83 = v81 || v82;
                  v72 = selfa;
                  if (v83)
                    continue;
LABEL_92:
                  objc_setProperty_atomic(v72, v78, v75, 48);
                  continue;
                }

                v72 = selfa;
              }
            }
            v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v151, 16);
            if (!v71)
            {
LABEL_96:

              if (v72)
                Property = objc_getProperty(selfa, v84, 48, 1);
              else
                Property = 0;
              v86 = Property;
              v87 = v86 == 0;

              if (v87)
              {
                if (objc_msgSend(v120, "isEqualToString:", CFSTR("L")))
                {
                  +[CRScriptCategoryV1 latinCyrillic]();
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  v70 = selfa;
                  if (selfa)
LABEL_103:
                    objc_setProperty_atomic(v70, v68, v69, 48);
                }
                else
                {
                  +[CRScriptCategoryV1 common]();
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  v70 = selfa;
                  if (selfa)
                    goto LABEL_103;
                }
LABEL_104:

              }
              v14 = 0;
              v40 = v102;
LABEL_106:

LABEL_107:
LABEL_108:

              objc_autoreleasePoolPop(context);
              if ((v14 | 4) == 4)
              {
                ++v117;
                goto LABEL_4;
              }
              goto LABEL_112;
            }
          }
        }
      }
      else
      {
        v40 = 0;
      }
      v14 = 4;
      goto LABEL_106;
    }
    if (-[CRCTCCVNLPOrientationDecoder shouldUseModernizedDecoder](v107, "shouldUseModernizedDecoder"))
    {
      objc_msgSend(v115, "score");
    }
    else
    {
      objc_msgSend(v115, "score");
      v16 = v15;
      v17 = objc_msgSend(v11, "length");
      if (!v17)
        goto LABEL_13;
      v13 = pow(v16, 1.0 / (double)v17);
    }
    v16 = v13;
LABEL_13:
    v145 = 0;
    v146 = &v145;
    v147 = 0x2020000000;
    v148 = 0;
    v141 = 0;
    v142 = &v141;
    v143 = 0x2020000000;
    v144 = 0;
    v18 = objc_msgSend(v11, "length");
    v140[0] = MEMORY[0x1E0C809B0];
    v140[1] = 3221225472;
    v140[2] = __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_2;
    v140[3] = &unk_1E98DAA58;
    v140[4] = &v145;
    v140[5] = &v141;
    objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", 0, v18, 2, v140);
    objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("S"), &stru_1E98DC948);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    if (selfa)
    {
      objc_setProperty_atomic(selfa, v20, v19, 40);

      v23 = objc_getProperty(selfa, v22, 40, 1);
    }
    else
    {

      v23 = 0;
    }
    v24 = v23;
    v25 = objc_msgSend(v24, "length");

    v26 = v146[3];
    v27 = v142[3];
    if (v26 >= v27)
    {
      v12 = selfa;
      if (v26 >= 1)
        v16 = v16 * ((double)v26 / (double)(v27 + v26));
      if (!selfa)
        goto LABEL_25;
      v28 = 1;
    }
    else
    {
      v12 = selfa;
      if (v27 >= 1)
        v16 = v16 * ((double)v27 / (double)(v27 + v26));
      if (!selfa)
        goto LABEL_25;
      v28 = 2;
    }
    v12[4] = v16;
    *((_QWORD *)v12 + 3) = v28;
LABEL_25:
    v109 += v25;
    _Block_object_dispose(&v141, 8);
    _Block_object_dispose(&v145, 8);
    v11 = newValue;
    goto LABEL_26;
  }
LABEL_112:
  if (v117 >= v114 && v108 && v109 >= 1)
  {
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v88 = v111;
    v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v123, v150, 16);
    if (v90)
    {
      v91 = *(_QWORD *)v124;
      do
      {
        v92 = 0;
        do
        {
          if (*(_QWORD *)v124 != v91)
            objc_enumerationMutation(v88);
          v93 = *(double **)(*((_QWORD *)&v123 + 1) + 8 * v92);
          if (v93)
            v94 = objc_getProperty(*(id *)(*((_QWORD *)&v123 + 1) + 8 * v92), v89, 40, 1);
          else
            v94 = 0;
          v95 = v94;
          v96 = v95 == 0;

          if (!v96)
          {
            if (v93)
              v97 = objc_getProperty(v93, v89, 40, 1);
            else
              v97 = 0;
            v98 = v97;
            v99 = objc_msgSend(v98, "length");
            if (v93)
              v93[4] = (double)v99 / (double)v109 * v93[4];

          }
          ++v92;
        }
        while (v90 != v92);
        v100 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v123, v150, 16);
        v90 = v100;
      }
      while (v100);
    }

  }
  return v117 >= v114;
}

void __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[6];

  v46[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "characterObservations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subarrayWithRange:", 0, 7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ED0B48B8;
  qword_1ED0B48B8 = v4;

  objc_msgSend(*(id *)(a1 + 32), "characterObservations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subarrayWithRange:", 14, 7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1ED0B48C0;
  qword_1ED0B48C0 = v8;

  objc_msgSend(*(id *)(a1 + 32), "characterObservations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subarrayWithRange:", 7, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "characterObservations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subarrayWithRange:", 21, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)qword_1ED0B48B8, "arrayByAddingObjectsFromArray:", qword_1ED0B48C0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)_MergedGlobals_36;
  _MergedGlobals_36 = v18;

  v20 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setWithArray:", v21);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)qword_1ED0B48A0;
  qword_1ED0B48A0 = v22;

  v24 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)qword_1ED0B48C0, "arrayByAddingObjectsFromArray:", v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWithArray:", v25);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)qword_1ED0B48A8;
  qword_1ED0B48A8 = v26;

  v28 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)qword_1ED0B48B8, "arrayByAddingObjectsFromArray:", v12);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v29);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)qword_1ED0B48B0;
  qword_1ED0B48B0 = v30;

  +[CRScriptCategoryV1 japanese]();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v32;
  +[CRScriptCategoryV1 korean]();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v33;
  +[CRScriptCategoryV1 chinese]();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v34;
  +[CRScriptCategoryV1 thai]();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v35;
  +[CRScriptCategoryV1 arabic]();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 5);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)qword_1ED0B48E0;
  qword_1ED0B48E0 = v37;

  objc_msgSend((id)qword_1ED0B48A0, "allObjects");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "componentsJoinedByString:", CFSTR("|"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v40, 0, 0);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)qword_1ED0B48D8;
  qword_1ED0B48D8 = v41;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@{2,}"), CFSTR("L"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v43, 1, 0);
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (void *)qword_1ED0B48D0;
  qword_1ED0B48D0 = v44;

}

void __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (objc_msgSend((id)_MergedGlobals_36, "containsObject:"))
  {
    v3 = *(_QWORD *)(a1 + 32);
LABEL_5:
    ++*(_QWORD *)(*(_QWORD *)(v3 + 8) + 24);
    goto LABEL_6;
  }
  if (objc_msgSend((id)qword_1ED0B48A0, "containsObject:", v4))
  {
    v3 = *(_QWORD *)(a1 + 40);
    goto LABEL_5;
  }
LABEL_6:

}

void __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (objc_msgSend((id)qword_1ED0B48B0, "containsObject:"))
  {
    v3 = *(_QWORD *)(a1 + 32);
LABEL_5:
    ++*(_QWORD *)(*(_QWORD *)(v3 + 8) + 24);
    goto LABEL_6;
  }
  if (objc_msgSend((id)qword_1ED0B48A8, "containsObject:", v4))
  {
    v3 = *(_QWORD *)(a1 + 40);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __161__CRCTCCVNLPOrientationDecoder__decodeFeaturesWithInfo_decoderCallback_shouldDecodeScriptResult_shouldDecodeOrientationResult_shouldDecodeLayoutDirectionResult___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v5 = a3;
  v6 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", a2);
  v7 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v5);
  if (v6 > v7)
    v8 = -1;
  else
    v8 = v6 < v7;

  return v8;
}

- (CRTextSequenceRecognizerModel)model
{
  return (CRTextSequenceRecognizerModel *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSOrderedSet)characterObservations
{
  return self->_characterObservations;
}

- (void).cxx_destruct
{
  unint64_t *begin;

  objc_storeStrong((id *)&self->_characterObservations, 0);
  objc_storeStrong((id *)&self->_model, 0);
  begin = self->_spaceLabels.__begin_;
  if (begin)
  {
    self->_spaceLabels.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
