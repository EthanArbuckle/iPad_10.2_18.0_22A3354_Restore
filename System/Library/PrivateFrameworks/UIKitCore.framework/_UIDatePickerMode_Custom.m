@implementation _UIDatePickerMode_Custom

- (_UIDatePickerMode_Custom)initWithFormatString:(id)a3 datePickerView:(id)a4
{
  id v5;
  _UIDatePickerMode_Custom *v6;
  uint64_t v7;
  NSString *originalFormat;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIDatePickerMode_Custom;
  v6 = -[_UIDatePickerMode init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    originalFormat = v6->_originalFormat;
    v6->_originalFormat = (NSString *)v7;

  }
  return v6;
}

- (void)noteCalendarChanged
{
  NSArray *components;
  objc_super v4;

  components = self->_components;
  self->_components = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UIDatePickerMode_Custom;
  -[_UIDatePickerMode noteCalendarChanged](&v4, sel_noteCalendarChanged);
}

- (void)resetComponentWidths
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[_UIDatePickerMode_Custom components](self, "components", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setWidth:", 0.0);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)components
{
  NSArray *components;
  NSString *originalFormat;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *v19;
  NSArray *sortedComponents;
  uint64_t v22;

  components = self->_components;
  if (!components)
  {
    originalFormat = self->_originalFormat;
    -[_UIDatePickerMode locale](self, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIDatePickerComponent componentsFromDateFormatString:locale:followsSystemHourCycle:](_UIDatePickerComponent, "componentsFromDateFormatString:locale:followsSystemHourCycle:", originalFormat, v5, -[_UIDatePickerMode followsSystemHourCycle](self, "followsSystemHourCycle"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_components;
    self->_components = v6;

    -[_UIDatePickerMode calendar](self, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray count](self->_components, "count"))
    {
      v9 = 0;
      v10 = 0;
      v22 = *MEMORY[0x1E0C99778];
      do
      {
        -[NSArray objectAtIndex:](self->_components, "objectAtIndex:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "equivalentUnit");
        if ((v12 & v9) != 0)
        {
          objc_msgSend(v11, "formatString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v14 = 0;
            while (1)
            {
              -[NSArray objectAtIndex:](self->_components, "objectAtIndex:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v12 == objc_msgSend(v15, "equivalentUnit"))
                break;

              if (v10 == ++v14)
                goto LABEL_9;
            }
            objc_msgSend(v15, "formatString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
LABEL_9:
            v16 = 0;
          }
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v22, CFSTR("Conflicting date formats: %@ and %@"), v16, v13);

        }
        v9 |= v12;
        v17 = objc_msgSend(v8, "maximumRangeOfUnit:", objc_msgSend(v11, "calendarUnit"));
        objc_msgSend(v11, "setUnitRange:", v17, v18);

        ++v10;
      }
      while (v10 < -[NSArray count](self->_components, "count"));
    }
    -[NSArray sortedArrayUsingComparator:](self->_components, "sortedArrayUsingComparator:", &__block_literal_global_386);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sortedComponents = self->_sortedComponents;
    self->_sortedComponents = v19;

    components = self->_components;
  }
  return components;
}

- (unint64_t)calendarUnitForComponent:(int64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[_UIDatePickerMode_Custom components](self, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "calendarUnit");

  return v6;
}

- (int64_t)componentForCalendarUnit:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;

  -[_UIDatePickerMode_Custom components](self, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      objc_msgSend(v4, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "calendarUnit");

      if (v9 == a3)
        break;
      if (v6 == ++v7)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)_componentForCalendarUnit:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[_UIDatePickerMode_Custom components](self, "components");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "calendarUnit", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (unint64_t)extractableCalendarUnits
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_UIDatePickerMode_Custom components](self, "components", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "calendarUnit");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (v5 >> 1) & 2 | v5;
}

- (int64_t)displayedCalendarUnits
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_UIDatePickerMode_Custom components](self, "components", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "calendarUnit");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)numberOfComponents
{
  void *v2;
  unint64_t v3;

  -[_UIDatePickerMode_Custom components](self, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)numberOfRowsInComponent:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[_UIDatePickerMode_Custom components](self, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "calendarUnit") == 0x10000)
    v6 = 2;
  else
    v6 = 10000;

  return v6;
}

- (id)dateFormatForCalendarUnit:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[_UIDatePickerMode_Custom _componentForCalendarUnit:](self, "_componentForCalendarUnit:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "formatString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)titleAlignmentForCalendarUnit:(unint64_t)a3
{
  return 1;
}

- (double)widthForCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5
{
  unint64_t v6;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t i;
  void *v35;
  double v36;
  int64_t v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;
  _QWORD v52[3];

  v6 = a3;
  v52[1] = *MEMORY[0x1E0C80C00];
  -[_UIDatePickerMode_Custom components](self, "components", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "width");
  v11 = v10;

  if (v11 == 0.0)
  {
    v43 = v6;
    v44 = -[_UIDatePickerMode_Custom numberOfComponents](self, "numberOfComponents");
    if (v44)
    {
      v12 = 0;
      v13 = *(_QWORD *)off_1E1678D90;
      v14 = 0.0;
      do
      {
        -[_UIDatePickerMode_Custom components](self, "components");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = v16;
        v17 = objc_msgSend(v16, "unitRange");
        v19 = v17 + v18;
        if ((uint64_t)(v17 + v18) >= 9000)
          v19 = 9000;
        if (v18 >= 0xC)
          v20 = 12;
        else
          v20 = v18;
        v21 = 0.0;
        if (v20)
        {
          v22 = 0;
          v23 = (uint64_t)(double)(v19 / v20);
          do
          {
            -[_UIDatePickerMode titleForRow:inComponent:](self, "titleForRow:inComponent:", v22, v12);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v13;
            -[_UIDatePickerMode font](self, "font");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v52[0] = v25;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "sizeWithAttributes:", v26);
            v28 = v27;

            if (v21 < v28)
              v21 = v28;

            v22 += v23;
            --v20;
          }
          while (v20);
        }
        objc_msgSend(v45, "setWidth:", v21);
        v14 = v14 + v21;

        ++v12;
      }
      while (v12 != v44);
    }
    else
    {
      v14 = 0.0;
    }
    v6 = v43;
    if (v14 > a5)
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      -[_UIDatePickerMode_Custom components](self, "components");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v47;
        v33 = a5 / v14;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v47 != v32)
              objc_enumerationMutation(v29);
            v35 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_msgSend(v35, "width");
            objc_msgSend(v35, "setWidth:", floor(v33 * v36));
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        }
        while (v31);
      }

    }
  }
  v37 = -[_UIDatePickerMode_Custom componentForCalendarUnit:](self, "componentForCalendarUnit:", v6);
  -[_UIDatePickerMode_Custom components](self, "components");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectAtIndex:", v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "width");
  v41 = v40;

  return v41;
}

- (id)dateForRow:(int64_t)a3 inCalendarUnit:(unint64_t)a4
{
  void *v7;
  void *v8;
  objc_super v10;

  -[_UIDatePickerMode_Custom _componentForCalendarUnit:](self, "_componentForCalendarUnit:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "equivalentUnit") == 4)
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIDatePickerMode_Custom;
    -[_UIDatePickerMode dateForRow:inCalendarUnit:](&v10, sel_dateForRow_inCalendarUnit_, a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (int64_t)valueForRow:(int64_t)a3 inCalendarUnit:(unint64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  if (a4 != 0x10000)
  {
    -[_UIDatePickerMode_Custom _componentForCalendarUnit:](self, "_componentForCalendarUnit:", a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "equivalentUnit") != 4)
    {
      v7 = objc_msgSend(v6, "unitRange");
      a3 = a3 % v8 + v7;
    }
    else
    {
      a3 = 0;
    }

  }
  return a3;
}

- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedComponents, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_originalFormat, 0);
}

@end
