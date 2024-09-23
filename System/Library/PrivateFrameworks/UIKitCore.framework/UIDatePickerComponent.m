@implementation UIDatePickerComponent

void __100___UIDatePickerComponent_componentsFromDateFormatString_locale_followsSystemHourCycle_desiredUnits___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  id v16;
  size_t v17;
  _WORD *v18;
  uint64_t v19;
  char v20;
  int v21;
  __int16 v22;
  unint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;

  v4 = *a2;
  if (!_UICalendarUnitIsSupported(*a2))
    return;
  if ((*(_QWORD *)(a1 + 64) & v4) == 0)
    return;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(_QWORD *)(v5 + 24);
  if ((v6 & v4) != 0)
    return;
  *(_QWORD *)(v5 + 24) = v6 | v4;
  v7 = (id)a2[2];
  v8 = a2[3];
  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _UIDatePickerDateFormatFromTemplate(v9, *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 88));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = *a2;
  v13 = *((unsigned __int16 *)a2 + 4);
  if (*a2 == 8)
  {
    v14 = 76;
    goto LABEL_11;
  }
  if (v12 == 512)
  {
    v14 = 99;
LABEL_11:
    if (v13 != v14)
    {
      if (v12 == 8)
      {
        v29 = v9;
        v30 = v8;
        v31 = v7;
        v15 = 76;
      }
      else
      {
        v29 = v9;
        v30 = v8;
        v31 = v7;
        if (v12 == 512)
          v15 = 99;
        else
          v15 = 113;
      }
      v16 = v10;
      v17 = objc_msgSend(v16, "length");
      v18 = malloc_type_calloc(v17, 2uLL, 0x1000040BDFB0063uLL);
      if (v17)
      {
        v19 = 0;
        v20 = 0;
        do
        {
          v21 = objc_msgSend(v16, "characterAtIndex:", v19);
          if (v20 & 1 | (v21 != v15))
            v22 = v21;
          else
            v22 = v13;
          if (v21 == 39)
          {
            v20 ^= 1u;
            v22 = 39;
          }
          v18[v19++] = v22;
        }
        while (v17 != v19);
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v18, v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      free(v18);

      v8 = v30;
      v7 = v31;
      v9 = v29;
    }
    goto LABEL_26;
  }
  if (v12 == 2048)
  {
    v14 = 113;
    goto LABEL_11;
  }
LABEL_26:
  v23 = objc_msgSend(v11, "length");
  if (v23 >= objc_msgSend(v9, "length")
    && objc_msgSend(*(id *)(a1 + 32), "rangeOfString:", v11) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v24 = v11;

    v9 = v24;
  }
  _UIDateFormatStripOtherFormatCharacters(v9, *((unsigned __int16 *)a2 + 4));
  v32 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v32, "length"))
  {
    v25 = -[_UIDatePickerComponent _initWithFormatString:calendarUnit:]([_UIDatePickerComponent alloc], "_initWithFormatString:calendarUnit:", v32, *a2);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v25);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(a1 + 72);
    v27 = *(_QWORD *)(a1 + 80);
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v7, v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v26, v27, CFSTR("_UIDatePickerComponent.m"), 207, CFSTR("Unable to handle '%@' from '%@'"), v28, *(_QWORD *)(a1 + 32));

  }
}

@end
