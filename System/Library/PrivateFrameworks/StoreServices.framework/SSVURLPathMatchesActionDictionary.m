@implementation SSVURLPathMatchesActionDictionary

uint64_t __SSVURLPathMatchesActionDictionary_block_invoke(uint64_t a1, uint64_t a2, void *a3, char *a4)
{
  uint64_t result;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:", a2);
      if (result != 0x7FFFFFFFFFFFFFFFLL)
      {
        result = objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 40));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        {
          v9 = 1;
        }
        else
        {
          v19 = a1;
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
          v11 = objc_msgSend(MEMORY[0x1E0CB3500], "uppercaseLetterCharacterSet");
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v21;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v21 != v14)
                  objc_enumerationMutation(a3);
                v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "mutableCopy", v19);
                v17 = objc_msgSend(v16, "rangeOfCharacterFromSet:options:range:", v11, 0, 0, objc_msgSend(v16, "length"));
                if (v17 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  for (j = v17;
                        j != 0x7FFFFFFFFFFFFFFFLL;
                        j = objc_msgSend(v16, "rangeOfCharacterFromSet:options:range:", v11, 0, j + 2, objc_msgSend(v16, "length") - (j + 2)))
                  {
                    objc_msgSend(v16, "insertString:atIndex:", CFSTR("-"), j);
                  }
                }
                objc_msgSend(v10, "addObject:", objc_msgSend(v16, "lowercaseString"));

              }
              v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            }
            while (v13);
          }
          result = objc_msgSend(v10, "containsObject:", *(_QWORD *)(v19 + 40));
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v19 + 48) + 8) + 24) = result;
          v9 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v19 + 48) + 8) + 24);
        }
        *a4 = v9;
      }
    }
  }
  return result;
}

@end
