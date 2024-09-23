@implementation EBContentFormatTable

+ (void)readWithState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  objc_msgSend(v3, "resources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentFormats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  XlContentFormatTable::XlContentFormatTable((XlContentFormatTable *)&v12);
  v6 = objc_msgSend(v3, "xlReader");
  (*(void (**)(uint64_t, void **))(*(_QWORD *)v6 + 176))(v6, &v12);
  if (((v14 - v13) & 0x7FFFFFFF8) != 0)
  {
    v7 = 0;
    v8 = ((unint64_t)(v14 - v13) >> 3);
    do
    {
      if (v7 >= ((unint64_t)(v14 - v13) >> 3))
        std::vector<TSU::UUIDData<TSP::UUIDData>>::__throw_out_of_range[abi:ne180100]();
      v9 = *(_QWORD *)(v13 + 8 * v7);
      objc_msgSend(v3, "resources");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[EBContentFormat edContentFormatFromXlFormat:edResources:](EBContentFormat, "edContentFormatFromXlFormat:edResources:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "addOrEquivalentObject:", v11);
      ++v7;
    }
    while (v8 != v7);
  }
  XlContentFormatTable::~XlContentFormatTable(&v12);

}

@end
