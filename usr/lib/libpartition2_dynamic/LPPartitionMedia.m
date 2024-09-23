@implementation LPPartitionMedia

+ (id)supportedContentTypes
{
  id v4;
  objc_super v5;

  if ((id)objc_opt_class() == a1)
  {
    v4 = (id)objc_msgSend(a1, "contentTypesForPartitionMedia");
    return v4;
  }
  else
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___LPPartitionMedia;
    return objc_msgSendSuper2(&v5, sel_supportedContentTypes);
  }
}

+ (id)contentTypesForPartitionMedia
{
  return &unk_24BF05E20;
}

+ (id)primaryMedia
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = +[LPMedia allMedia](LPMedia, "allMedia");
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "isPrimaryMedia", (_QWORD)v8))
        {
          v3 = v6;
          goto LABEL_12;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (id)children
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  io_object_t v16;
  io_object_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 16);
  v17 = 0;
  if (MEMORY[0x20BCF2F90](-[LPMedia ioMedia](self, "ioMedia"), "IOService", 1, &v17))
  {
    _os_log_pack_size();
    *(_WORD *)_os_log_pack_fill() = 0;
    _LPLogPack(1);
    v4 = (id)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v5 = MEMORY[0x24BDAC760];
    v6 = v17;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3254779904;
    v14[2] = __28__LPPartitionMedia_children__block_invoke;
    v14[3] = &__block_descriptor_44_e8_32s_e8_v12__0I8l;
    v16 = v17;
    v15 = v3;
    v9 = v5;
    v10 = 3254779904;
    v11 = __28__LPPartitionMedia_children__block_invoke_10;
    v12 = &__block_descriptor_40_e8_32s_e5_v8__0l;
    v7 = v15;
    v13 = v7;
    iterateSafely(v6, 3, v14, &v9);
    IOObjectRelease(v17);
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v7, v9, v10, v11, v12);

  }
  return v4;
}

void __28__LPPartitionMedia_children__block_invoke(uint64_t a1, uint64_t object)
{
  id v4;

  if (IOObjectConformsTo(object, "IOMedia"))
  {
    MEMORY[0x20BCF2FC0](*(unsigned int *)(a1 + 40));
    v4 = +[LPMedia mediaOfCorrectTypeGivenIOMedia:](LPMedia, "mediaOfCorrectTypeGivenIOMedia:", object);
    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
}

uint64_t __28__LPPartitionMedia_children__block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
}

@end
