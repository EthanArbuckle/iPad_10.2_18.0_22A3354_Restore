@implementation WBTableRowProperties

+ (void)readFrom:(id)a3 wrdProperties:(void *)a4 tracked:(void *)a5 properties:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v10 = a6;
  v11 = v10;
  if (a4 && v10)
  {
    objc_msgSend(v10, "tableProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      +[WBTableProperties readFrom:wrdProperties:tracked:properties:](WBTableProperties, "readFrom:wrdProperties:tracked:properties:", v13, a4, a5, v12);
    objc_msgSend(v11, "setResolveMode:", 0);
    objc_msgSend(a1, "mapWordProperties:toProperties:", a4, v11);
    if (a5
      && WrdTableProperties::WrdTablePropertiesOverridden::isAnythingOverridden((WrdTableProperties::WrdTablePropertiesOverridden *)((char *)a5 + 16)))
    {
      objc_msgSend(v11, "setResolveMode:", 1);
      objc_msgSend(a1, "mapWordProperties:toProperties:", a5, v11);
    }
    objc_msgSend(v11, "setResolveMode:", 2);

  }
}

+ (void)mapWordProperties:(void *)a3 toProperties:(id)a4
{
  id v5;
  uint64_t v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;

  v5 = a4;
  v6 = *((_QWORD *)a3 + 2);
  v11 = v5;
  if ((v6 & 0x800000000000000) != 0)
  {
    objc_msgSend(v5, "setWidthBefore:", *((__int16 *)a3 + 170));
    v6 = *((_QWORD *)a3 + 2);
  }
  v7 = *((_DWORD *)a3 + 6);
  if ((v6 & 0x20000) != 0)
  {
    objc_msgSend(v11, "setWidthBeforeType:", *((unsigned int *)a3 + 35));
    v6 = *((_QWORD *)a3 + 2);
    v7 = *((_DWORD *)a3 + 6);
  }
  if ((v6 & 0x1000000000000000) != 0)
  {
    objc_msgSend(v11, "setWidthAfter:", *((__int16 *)a3 + 171));
    v6 = *((_QWORD *)a3 + 2);
    v7 = *((_DWORD *)a3 + 6);
  }
  if ((v6 & 0x40000) != 0)
  {
    objc_msgSend(v11, "setWidthAfterType:", *((unsigned int *)a3 + 36));
    v6 = *((_QWORD *)a3 + 2);
    v7 = *((_DWORD *)a3 + 6);
  }
  if ((v7 & 0x100000) != 0)
  {
    objc_msgSend(v11, "setHeader:", *((_BYTE *)a3 + 387) != 0);
    v6 = *((_QWORD *)a3 + 2);
  }
  v8 = v11;
  if ((v6 & 0x100000000000) != 0)
  {
    v9 = *((_DWORD *)a3 + 75);
    objc_msgSend(v11, "setHeightType:", v9 >= 0);
    if (v9 >= 0)
      v10 = v9;
    else
      v10 = -v9;
    objc_msgSend(v11, "setHeight:", v10);
    v8 = v11;
  }

}

+ (void)write:(id)a3 properties:(id)a4 wrdProperties:(void *)a5 tracked:(void *)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = v10;
  if (v10 && a5)
  {
    objc_msgSend(v10, "tableProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      +[WBTableProperties write:properties:wrdProperties:tracked:](WBTableProperties, "write:properties:wrdProperties:tracked:", v13, v12, a5, a6);
    objc_msgSend(v11, "setResolveMode:", 0);
    objc_msgSend(a1, "mapProperties:toWordProperties:", v11, a5);
    objc_msgSend(v11, "setResolveMode:", 2);

  }
}

+ (void)mapProperties:(id)a3 toWordProperties:(void *)a4
{
  uint64_t v5;
  int v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isWidthBeforeOverridden"))
    WrdTableProperties::setWidthOfInvisibleCellBefore((WrdTableProperties *)a4, objc_msgSend(v7, "widthBefore"));
  if (objc_msgSend(v7, "isWidthBeforeTypeOverridden"))
    WrdTableProperties::setWidthOfInvisibleCellBeforeUnit((uint64_t)a4, objc_msgSend(v7, "widthBeforeType"));
  if (objc_msgSend(v7, "isWidthAfterOverridden"))
    WrdTableProperties::setWidthOfInvisibleCellAfter((WrdTableProperties *)a4, objc_msgSend(v7, "widthAfter"));
  if (objc_msgSend(v7, "isWidthAfterTypeOverridden"))
    WrdTableProperties::setWidthOfInvisibleCellAfterUnit((uint64_t)a4, objc_msgSend(v7, "widthAfterType"));
  if (objc_msgSend(v7, "isHeaderOverridden"))
    WrdTableProperties::setTableHeader((WrdTableProperties *)a4, objc_msgSend(v7, "header"));
  if (objc_msgSend(v7, "isHeightOverridden"))
    v5 = objc_msgSend(v7, "height");
  else
    v5 = 1;
  v6 = objc_msgSend(v7, "isHeightTypeOverridden");
  if (v6)
    v6 = objc_msgSend(v7, "heightType");
  if (!v6 && v5 > 0 || v6 == 1 && v5 < 0)
    v5 = -v5;
  WrdTableProperties::setRowHeight((WrdTableProperties *)a4, v5);
  WrdTableProperties::setDefaultTableLeftCellPaddingUnit((uint64_t)a4, 3);
  WrdTableProperties::setDefaultTableRightCellPaddingUnit((uint64_t)a4, 3);
  WrdTableProperties::setHalfOfGapBetweenTextInAdjColOfTableRow((WrdTableProperties *)a4, 108);
  WrdTableProperties::setDefaultTableLeftCellPadding((WrdTableProperties *)a4, 108);
  WrdTableProperties::setDefaultTableRightCellPadding((WrdTableProperties *)a4, 108);
  WrdTableProperties::setCantSplit((WrdTableProperties *)a4, 1);

}

@end
