@implementation DASSchedulerClass

Class __get_DASSchedulerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!qword_1ECDA58B0)
    qword_1ECDA58B0 = _sl_dlopen();
  if (!qword_1ECDA58B0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *DuetActivitySchedulerLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("UISApplicationStateService.m"), 33, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("_DASScheduler");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class get_DASSchedulerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("UISApplicationStateService.m"), 34, CFSTR("Unable to find class %s"), "_DASScheduler");

LABEL_8:
    __break(1u);
  }
  qword_1ECDA58A8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

@end
