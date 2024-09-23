@implementation BestPathForTraits

uint64_t __BestPathForTraits_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  int64_t v8;
  unint64_t v9;
  double v10;
  double v11;
  uint64_t result;
  double v13;

  v7 = a2;
  v8 = +[UIImage _idiomDefinedByPath:](UIImage, "_idiomDefinedByPath:", v7);
  v9 = +[UIImage _scaleDefinedByPath:](UIImage, "_scaleDefinedByPath:", v7);

  v10 = (double)v9;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL
    && (v8 == 0x7FFFFFFFFFFFFFFFLL || v8 == objc_msgSend(*(id *)(a1 + 32), "userInterfaceIdiom")))
  {
    if (v10 == 9.22337204e18 || (objc_msgSend(*(id *)(a1 + 32), "displayScale"), v11 >= v10))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
  result = objc_msgSend(*(id *)(a1 + 32), "userInterfaceIdiom");
  if (v8 == result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "displayScale");
    if (v13 == v10)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
      *a4 = 1;
    }
  }
  return result;
}

@end
