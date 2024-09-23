@implementation TPSLogger

+ (OS_os_log)targeting
{
  return (OS_os_log *)sub_19A91ED6C((uint64_t)a1, (uint64_t)a2, qword_1ED03CFF0, qword_1ED03CFE0);
}

+ (OS_os_log)daemon
{
  return (OS_os_log *)sub_19A91ED6C((uint64_t)a1, (uint64_t)a2, &qword_1ED03CFD8, (id *)&qword_1ED03CFD0);
}

+ (OS_os_log)analytics
{
  return (OS_os_log *)sub_19A91ED6C((uint64_t)a1, (uint64_t)a2, &qword_1ED03D590, (id *)&qword_1ED03D598);
}

+ (OS_os_log)default
{
  return (OS_os_log *)sub_19A91ED6C((uint64_t)a1, (uint64_t)a2, &qword_1ED03D5E8, (id *)&qword_1ED03D5F0);
}

+ (OS_os_log)data
{
  return (OS_os_log *)sub_19A91ED6C((uint64_t)a1, (uint64_t)a2, &qword_1ED03D5D0, (id *)&qword_1ED03D5D8);
}

+ (OS_os_log)indexing
{
  return (OS_os_log *)sub_19A91ED6C((uint64_t)a1, (uint64_t)a2, &qword_1ED03D170, (id *)&qword_1ED03D168);
}

+ (OS_os_log)discoverability
{
  return (OS_os_log *)sub_19A91ED6C((uint64_t)a1, (uint64_t)a2, &qword_1ED03CFC8, (id *)&qword_1ED03CFB0);
}

+ (OS_os_log)tipkit
{
  return (OS_os_log *)sub_19A91ED6C((uint64_t)a1, (uint64_t)a2, &qword_1ED03D588, qword_1ED03D578);
}

+ (OS_os_log)welcome
{
  return (OS_os_log *)sub_19A91ED6C((uint64_t)a1, (uint64_t)a2, &qword_1ED03D190, qword_1ED03D180);
}

+ (OS_os_log)widget
{
  return (OS_os_log *)sub_19A91ED6C((uint64_t)a1, (uint64_t)a2, &qword_1ED03D198, qword_1ED03D1A0);
}

+ (OS_os_log)search
{
  return (OS_os_log *)sub_19A91ED6C((uint64_t)a1, (uint64_t)a2, &qword_1EE3B6098, (id *)&qword_1EE3B6508);
}

- (TPSLogger)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TPSLogger();
  return -[TPSLogger init](&v3, sel_init);
}

@end
