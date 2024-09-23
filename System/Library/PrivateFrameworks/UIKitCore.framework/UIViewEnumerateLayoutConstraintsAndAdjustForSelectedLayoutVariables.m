@implementation UIViewEnumerateLayoutConstraintsAndAdjustForSelectedLayoutVariables

uint64_t ___UIViewEnumerateLayoutConstraintsAndAdjustForSelectedLayoutVariables_block_invoke(_QWORD *a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  for (result = a1[4]; result; result = objc_msgSend(v10, "superview"))
  {
    v10 = (void *)result;
    v3 = (void *)objc_msgSend((id)objc_msgSend((id)result, "_constraintsExceptingSubviewAutoresizingConstraints"), "copy");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
          if (v8)
          {
            objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "firstItem"), "_referenceView");
            objc_msgSend(v8, "firstAttribute");
            objc_msgSend((id)objc_msgSend(v8, "secondItem"), "_referenceView");
          }
          else
          {
            objc_msgSend(0, "firstAttribute");
          }
          objc_msgSend(v8, "secondAttribute");
          if (((*(uint64_t (**)(void))(a1[5] + 16))() & 1) != 0 || (*(unsigned int (**)(void))(a1[5] + 16))())
            (*(void (**)(void))(a1[6] + 16))();
          ++v7;
        }
        while (v5 != v7);
        v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v5 = v9;
      }
      while (v9);
    }

    if (v10 != (void *)a1[4])
    {
      result = objc_msgSend(v10, "_hostsLayoutEngine");
      if ((result & 1) != 0)
        break;
    }
  }
  return result;
}

@end
