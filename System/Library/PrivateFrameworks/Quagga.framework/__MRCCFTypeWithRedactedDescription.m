@implementation __MRCCFTypeWithRedactedDescription

- (NSString)redactedDescription
{
  uint64_t v2;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  NSString *v13;
  unint64_t v15;
  __MRCCFTypeWithRedactedDescription *v16;

  v4 = objc_msgSend__cfTypeID(self, a2, v2);
  os_unfair_lock_lock_with_options();
  if (qword_1EFE31788 != -1)
    dispatch_once(&qword_1EFE31788, &unk_1E95B0490);
  if (!*((_QWORD *)&xmmword_1EFE31758 + 1))
    goto LABEL_20;
  v5 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&xmmword_1EFE31758 + 8));
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    v6 = v4;
    if (v4 >= *((_QWORD *)&xmmword_1EFE31758 + 1))
      v6 = v4 % *((_QWORD *)&xmmword_1EFE31758 + 1);
  }
  else
  {
    v6 = (*((_QWORD *)&xmmword_1EFE31758 + 1) - 1) & v4;
  }
  v7 = *(_QWORD **)(xmmword_1EFE31758 + 8 * v6);
  if (v7)
  {
    v8 = (_QWORD *)*v7;
    if (*v7)
    {
      do
      {
        v9 = v8[1];
        if (v9 == v4)
        {
          if (v8[2] == v4)
            break;
        }
        else
        {
          if (v5.u32[0] > 1uLL)
          {
            if (v9 >= *((_QWORD *)&xmmword_1EFE31758 + 1))
              v9 %= *((_QWORD *)&xmmword_1EFE31758 + 1);
          }
          else
          {
            v9 &= *((_QWORD *)&xmmword_1EFE31758 + 1) - 1;
          }
          if (v9 != v6)
            goto LABEL_20;
        }
        v8 = (_QWORD *)*v8;
      }
      while (v8);
    }
  }
  else
  {
LABEL_20:
    v8 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EFE31750);
  if (!v8)
    return (NSString *)MEMORY[0x1E0DE7D20](self, sel_description, v10);
  v16 = self;
  v11 = v8[6];
  if (!v11)
    sub_1D3D75A24();
  (*(void (**)(unint64_t *__return_ptr, uint64_t, __MRCCFTypeWithRedactedDescription **))(*(_QWORD *)v11 + 48))(&v15, v11, &v16);
  do
    v12 = (const void *)__ldaxr(&v15);
  while (__stlxr(0, &v15));
  v13 = (id)CFMakeCollectable(v12);
  sub_1D3D8C70C(&v15);
  return v13;
}

@end
