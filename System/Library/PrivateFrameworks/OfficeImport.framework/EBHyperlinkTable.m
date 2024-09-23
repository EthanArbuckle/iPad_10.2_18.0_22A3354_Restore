@implementation EBHyperlinkTable

+ (void)readWithState:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void (**v16)(XlCollection *__hidden);
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  v18 = 0;
  v19 = 0;
  v16 = &off_24F3A7D50;
  v17 = 0;
  v4 = objc_msgSend(v3, "xlReader");
  (*(void (**)(uint64_t, void (***)(XlCollection *__hidden)))(*(_QWORD *)v4 + 480))(v4, &v16);
  v5 = v18 - (_QWORD)v17;
  if (((unint64_t)(v18 - (_QWORD)v17) >> 3))
  {
    objc_msgSend(v3, "edSheet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hyperlinks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (v5 >> 3);

    v9 = 0;
    do
    {
      if (v9 >= ((unint64_t)(v18 - (_QWORD)v17) >> 3))
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      v10 = v17[v9];
      if (*(_WORD *)(v10 + 12) == 2048)
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend(v3, "resources");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[EBHyperlink edHyperlinkFromXlHLink:edResources:](EBHyperlink, "edHyperlinkFromXlHLink:edResources:", v10, v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v13 = v9 + 1;
      if (v9 + 1 < v8)
      {
        if (v13 >= ((unint64_t)(v18 - (_QWORD)v17) >> 3))
          std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
        v14 = v17[v13];
        if (*(_WORD *)(v14 + 12) == 2048)
        {
          objc_msgSend(v3, "resources");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          +[EBHyperlink addToolTip:toEdHyperLink:edResources:](EBHyperlink, "addToolTip:toEdHyperLink:edResources:", v14, v11, v15);

          ++v9;
        }
      }
      objc_msgSend(v7, "addObject:", v11);

      ++v9;
    }
    while (v9 < v8);

  }
  v16 = &off_24F3A7B20;
  CsSimpleHeapVector<XlRecord>::~CsSimpleHeapVector((void **)&v17);

}

@end
