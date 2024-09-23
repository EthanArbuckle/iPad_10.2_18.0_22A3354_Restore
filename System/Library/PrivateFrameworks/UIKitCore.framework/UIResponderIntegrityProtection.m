@implementation UIResponderIntegrityProtection

void __38___UIResponderIntegrityProtection_rip__block_invoke()
{
  int v0;
  int v1;
  uint64_t v2;
  void *v3;
  int ClassList;
  int v5;
  uint64_t v6;
  Class *v7;
  Class *v8;
  uint64_t v9;
  uint64_t i;
  objc_class *v11;
  _BOOL4 v12;
  BOOL v13;
  objc_class *Superclass;
  unint64_t v15;
  NSObject *v16;
  uint8_t *v17;
  unint64_t v18;
  unint64_t v19;
  NSObject *v20;
  uint8_t v21[16];
  uint8_t buf[2];
  __int16 v23;

  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    v1 = _UIInternalPreference_ResponderIntegrityProtection;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ResponderIntegrityProtection)
    {
      while (v0 >= v1)
      {
        _UIInternalPreferenceSync(v0, &_UIInternalPreference_ResponderIntegrityProtection, (uint64_t)CFSTR("ResponderIntegrityProtection"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v1 = _UIInternalPreference_ResponderIntegrityProtection;
        if (v0 == _UIInternalPreference_ResponderIntegrityProtection)
          return;
      }
      if (byte_1EDDA80DC)
      {
        v2 = objc_opt_new();
        v3 = (void *)_MergedGlobals_1061;
        _MergedGlobals_1061 = v2;

        ClassList = objc_getClassList(0, 0);
        if (ClassList <= 0)
        {
          v15 = qword_1ECD7DDD0;
          if (!qword_1ECD7DDD0)
          {
            v15 = __UILogCategoryGetNode("ResponderIntegrityProtection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v15, (unint64_t *)&qword_1ECD7DDD0);
          }
          v16 = *(NSObject **)(v15 + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v23 = 0;
            v17 = (uint8_t *)&v23;
LABEL_33:
            _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, "Unable to fetch class list.", v17, 2u);
          }
        }
        else
        {
          v5 = ClassList;
          v6 = ClassList;
          v7 = (Class *)malloc_type_calloc(ClassList, 8uLL, 0x80040B8603338uLL);
          if (v7)
          {
            v8 = v7;
            if (objc_getClassList(v7, v5) == v5)
            {
              v9 = objc_opt_class();
              for (i = 0; i != v6; ++i)
              {
                v11 = v8[i];
                v12 = v11 != 0;
                if (v11)
                  v13 = v11 == (objc_class *)v9;
                else
                  v13 = 1;
                if (!v13)
                {
                  Superclass = v8[i];
                  do
                  {
                    Superclass = class_getSuperclass(Superclass);
                    v12 = Superclass != 0;
                  }
                  while (Superclass && Superclass != (objc_class *)v9);
                }
                if (v12)
                {
                  _rip_inject_method(v11, sel_pressesBegan_withEvent_);
                  _rip_inject_method(v11, sel_pressesChanged_withEvent_);
                  _rip_inject_method(v11, sel_pressesEnded_withEvent_);
                  _rip_inject_method(v11, sel_pressesCancelled_withEvent_);
                }
              }
              free(v8);
            }
            else
            {
              v19 = qword_1ECD7DDE0;
              if (!qword_1ECD7DDE0)
              {
                v19 = __UILogCategoryGetNode("ResponderIntegrityProtection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v19, (unint64_t *)&qword_1ECD7DDE0);
              }
              v20 = *(NSObject **)(v19 + 8);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)v21 = 0;
                _os_log_impl(&dword_185066000, v20, OS_LOG_TYPE_ERROR, "Unable to fetch class list.", v21, 2u);
              }
              free(v8);
            }
            return;
          }
          v18 = qword_1ECD7DDD8;
          if (!qword_1ECD7DDD8)
          {
            v18 = __UILogCategoryGetNode("ResponderIntegrityProtection", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v18, (unint64_t *)&qword_1ECD7DDD8);
          }
          v16 = *(NSObject **)(v18 + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v17 = buf;
            goto LABEL_33;
          }
        }
      }
    }
  }
}

@end
