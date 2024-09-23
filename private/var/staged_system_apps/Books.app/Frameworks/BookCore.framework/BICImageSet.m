@implementation BICImageSet

- (id)primaryEntry
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSet imageEntries](self, "imageEntries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BICImageSet primaryEntryFromEntries:](BICImageSet, "primaryEntryFromEntries:", v2));

  return v3;
}

+ (id)primaryEntryFromEntries:(id)a3
{
  id v3;
  id v4;
  id v5;
  unsigned __int16 v6;
  signed __int16 v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "potentialPrimary"))
        {
          if (objc_msgSend(v11, "quality") > v6)
          {
            v12 = v11;

            v7 = (unsigned __int16)objc_msgSend(v12, "level");
            v6 = (unsigned __int16)objc_msgSend(v12, "quality");
LABEL_9:
            v8 = v12;
            continue;
          }
          if (objc_msgSend(v11, "quality") == v6 && (int)objc_msgSend(v11, "level") > v7)
          {
            v12 = v11;

            v7 = (unsigned __int16)objc_msgSend(v12, "level");
            goto LABEL_9;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (!v5)
        goto LABEL_17;
    }
  }
  v8 = 0;
LABEL_17:

  return v8;
}

- (id)imageColor
{
  void *v3;

  if (-[BICImageSet imageColorARGBHex](self, "imageColorARGBHex") == (id)0xFFFFFF)
    v3 = 0;
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_colorWithARGBHexValue:](UIColor, "bc_colorWithARGBHexValue:", -[BICImageSet imageColorARGBHex](self, "imageColorARGBHex")));
  return v3;
}

@end
