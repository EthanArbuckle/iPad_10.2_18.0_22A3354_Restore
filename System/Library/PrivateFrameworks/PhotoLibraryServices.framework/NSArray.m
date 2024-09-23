@implementation NSArray

uint64_t __44__NSArray_PhotoLibraryServices___pl_filter___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __62__NSArray_Additions__pl_indexOfLastObjectInRange_passingTest___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))() ^ 1;
}

uint64_t __63__NSArray_Additions__pl_indexOfFirstObjectInRange_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  return v6;
}

uint64_t __61__NSArray_Additions__pl_arrayOfUniqueObjectsNotInOrderedSet___block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 > *a3)
    return 1;
  else
    return ((uint64_t)(*a2 - *a3) >> 63);
}

id __65__NSArray_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke(uint64_t a1)
{
  unint64_t v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  void *v14;
  uint64_t v15;
  int v16;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count") - 1;
  if (v2 <= 0x3B9AC9FF)
  {
    if (v2 <= 0x5F5E0FF)
    {
      if (v2 <= 0x98967F)
      {
        if (v2 <= 0xF423F)
        {
          if (v2 >> 5 <= 0xC34)
          {
            if (v2 >> 4 <= 0x270)
            {
              if (v2 <= 0x3E7)
              {
                if (v2 <= 0x63)
                {
                  if (v2 <= 9)
                    v3 = 1;
                  else
                    v3 = 2;
                }
                else
                {
                  v3 = 3;
                }
              }
              else
              {
                v3 = 4;
              }
            }
            else
            {
              v3 = 5;
            }
          }
          else
          {
            v3 = 6;
          }
        }
        else
        {
          v3 = 7;
        }
      }
      else
      {
        v3 = 8;
      }
    }
    else
    {
      v3 = 9;
    }
  }
  else
  {
    v3 = 10;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLIndentToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("<%@: %p> ["), objc_opt_class(), *(_QWORD *)(a1 + 32));
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__NSArray_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke_2;
  v12[3] = &unk_1E36716E8;
  v6 = *(void **)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v13 = v7;
  v14 = v5;
  v16 = v3;
  v8 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
  objc_msgSend(v7, "appendFormat:", CFSTR("\n%@]"), v8);
  v9 = v14;
  v10 = v7;

  return v10;
}

void __65__NSArray_PhotoLibraryServices___pl_prettyDescriptionWithIndent___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;

  objc_msgSend(a2, "_pl_prettyDescriptionWithIndent:", *(_QWORD *)(a1 + 48) + 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\n%@%@[%*lu]: %@"), *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D74110], *(unsigned int *)(a1 + 56), a3, v5);

}

void __45__NSArray_PhotoLibraryServices___pl_flatMap___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObjectsFromArray:", v2);

}

@end
