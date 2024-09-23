@implementation NEFlowDirectorHandleNewControlSocket

os_unfair_lock_s *__NEFlowDirectorHandleNewControlSocket_block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v3;
  NSObject *v4;
  os_unfair_lock_s *result;
  os_unfair_lock_s *v6;
  uint32_t os_unfair_lock_opaque;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int *v14;
  char *v15;
  const char *v16;
  int v17;
  int *v18;
  char *v19;
  int v20;
  socklen_t v21;
  sockaddr v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 40))
    __assert_rtn("NEFlowDirectorHandleNewControlSocket_block_invoke", "NEFlow.c", 3866, "director->data_source == NULL");
  v3 = *(_DWORD *)(a1 + 40);
  if ((v3 & 0x80000000) == 0)
  {
    v20 = 0x100000;
    if (setsockopt(v3, 0xFFFF, 4097, &v20, 4u))
    {
      v4 = ne_log_obj();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        goto LABEL_5;
      v17 = dword_25453C118;
      v18 = __error();
      v19 = strerror(*v18);
      *(_DWORD *)&v22[0].sa_len = 67109378;
      *(_DWORD *)&v22[0].sa_data[2] = v17;
      *(_WORD *)&v22[0].sa_data[6] = 2080;
      *(_QWORD *)&v22[0].sa_data[8] = v19;
      v16 = "(%u): Failed to set SO_SNDBUF on the data control socket: %s";
    }
    else
    {
      v8 = *(_DWORD *)(a1 + 40);
      v21 = 32;
      memset(v22, 0, sizeof(v22));
      v9 = getpeername(v8, v22, &v21);
      v10 = *(_DWORD *)&v22[0].sa_data[6];
      if (v9)
        v10 = 0;
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)(v11 + 48) = v10;
      if (v10)
      {
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = flow_director_create_io_handler(v11, *(_DWORD *)(a1 + 40));
        v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
        if (v12)
          dispatch_resume(v12);
        goto LABEL_6;
      }
      v4 = ne_log_obj();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
LABEL_5:
        close(*(_DWORD *)(a1 + 40));
LABEL_6:
        v1 = *(_QWORD *)(a1 + 32);
        goto LABEL_7;
      }
      v13 = dword_25453C118;
      v14 = __error();
      v15 = strerror(*v14);
      *(_DWORD *)&v22[0].sa_len = 67109378;
      *(_DWORD *)&v22[0].sa_data[2] = v13;
      *(_WORD *)&v22[0].sa_data[6] = 2080;
      *(_QWORD *)&v22[0].sa_data[8] = v15;
      v16 = "(%u): getpeername failed on the data control socket: %s";
    }
    _os_log_error_impl(&dword_208439000, v4, OS_LOG_TYPE_ERROR, v16, &v22[0].sa_len, 0x12u);
    goto LABEL_5;
  }
LABEL_7:
  result = (os_unfair_lock_s *)rb_tree_iterate((rb_tree_t *)(v1 + 56), 0, 1u);
  if (result)
  {
    v6 = result;
    do
    {
      os_unfair_lock_lock(v6 + 30);
      os_unfair_lock_opaque = v6[25]._os_unfair_lock_opaque;
      if ((os_unfair_lock_opaque & 8) != 0)
      {
        v6[25]._os_unfair_lock_opaque = os_unfair_lock_opaque & 0xFFFFFFF7;
        flow_startup((uint64_t)v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) == 0);
      }
      os_unfair_lock_unlock(v6 + 30);
      result = (os_unfair_lock_s *)rb_tree_iterate((rb_tree_t *)(*(_QWORD *)(a1 + 32) + 56), v6, 1u);
      v6 = result;
    }
    while (result);
  }
  return result;
}

@end
