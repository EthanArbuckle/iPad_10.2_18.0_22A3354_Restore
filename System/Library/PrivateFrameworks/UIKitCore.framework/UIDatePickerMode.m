@implementation UIDatePickerMode

double __31___UIDatePickerMode_initialize__block_invoke()
{
  _OWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x60uLL, 0x1000040565EDBD2uLL);
  _UIDateComponentsUnitOrder = (uint64_t)v0;
  *v0 = xmmword_186682100;
  v0[1] = xmmword_186682110;
  v0[2] = xmmword_186682120;
  v0[3] = xmmword_186682130;
  *(_QWORD *)&result = 2048;
  v0[4] = xmmword_186682140;
  v0[5] = xmmword_186682150;
  return result;
}

uint64_t __38___UIDatePickerMode_Custom_components__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v14;
  uint64_t v16;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "equivalentUnit");
  v7 = objc_msgSend(v5, "equivalentUnit");
  v8 = *(_QWORD *)_UIDateComponentsUnitOrder;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (*(_QWORD *)_UIDateComponentsUnitOrder == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_2;
  v11 = 0;
  do
  {
    if (v10 == 0x7FFFFFFFFFFFFFFFLL && v8 == v6)
      v10 = v11;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL && v8 == v7)
      v9 = v11;
    v14 = v10 == 0x7FFFFFFFFFFFFFFFLL;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = 0;
      goto LABEL_21;
    }
    v8 = *(_QWORD *)(_UIDateComponentsUnitOrder + 8 + 8 * v11++);
  }
  while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_2;
LABEL_21:
  if (v14)
LABEL_2:
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("unable to sort units: (%lu => %lu) and (%lu => %lu)"), objc_msgSend(v4, "calendarUnit"), v6, objc_msgSend(v5, "calendarUnit"), v7);
  if (v10 < v9)
    v16 = -1;
  else
    v16 = v10 > v9;

  return v16;
}

@end
