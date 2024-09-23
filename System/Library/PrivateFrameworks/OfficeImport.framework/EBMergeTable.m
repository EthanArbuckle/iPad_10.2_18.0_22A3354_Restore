@implementation EBMergeTable

+ (void)readWithState:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v4 = objc_msgSend(v3, "xlReader", &off_24F3AF930);
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v4 + 552))(v4, &v10);
  v5 = (unint64_t)(v12 - v11) >> 3;
  if ((_DWORD)v5)
  {
    objc_msgSend(v3, "edSheet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mergedCells");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    do
    {
      +[EBReference edReferenceFromXlRef:](EBReference, "edReferenceFromXlRef:", XlConditionalFormatTable::at((XlConditionalFormatTable *)&v10, v8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addOrEquivalentObject:", v9);

      ++v8;
    }
    while ((_DWORD)v5 != v8);

  }
  XlMergeTable::~XlMergeTable((XlMergeTable *)&v10);

}

@end
