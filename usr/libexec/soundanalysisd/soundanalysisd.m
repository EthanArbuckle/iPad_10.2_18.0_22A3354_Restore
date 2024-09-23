int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t MainExecutor;
  uint64_t v5;
  uint64_t v6;
  int result;

  v3 = swift_task_create(2048, 0, (char *)&type metadata for () + 8, &unk_100008000, 0);
  MainExecutor = swift_task_getMainExecutor();
  v6 = swift_job_run(v3, MainExecutor, v5);
  result = swift_task_asyncMainDrainQueue(v6);
  __break(1u);
  return result;
}

uint64_t sub_1000036E0()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v0[2] = swift_task_getMainExecutor();
  v0[3] = v1;
  nullsub_1();
  v2 = (_QWORD *)swift_task_alloc(async function pointer to static SNDaemon.soundanalysisdLaunch()[1]);
  v0[4] = v2;
  *v2 = v0;
  v2[1] = sub_100003734;
  return static SNDaemon.soundanalysisdLaunch()();
}

uint64_t sub_100003734()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 32);
  *(_QWORD *)(*v1 + 40) = v0;
  swift_task_dealloc(v3);
  if (v0)
    v4 = sub_1000037B0;
  else
    v4 = sub_100003794;
  return swift_task_switch(v4, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_100003794()
{
  exit(0);
}

uint64_t sub_1000037B0()
{
  uint64_t v0;

  return swift_errorInMain(*(_QWORD *)(v0 + 40));
}

uint64_t sub_1000037B8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_10000800C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1000037FC;
  return sub_1000036E0();
}

uint64_t sub_1000037FC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}
