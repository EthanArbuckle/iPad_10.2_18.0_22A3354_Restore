@implementation SMBSocket

- (int)openSocket:(id)a3
{
  id v5;
  int v6;
  NSMutableArray *v7;
  NSMutableArray *io_rqlist;
  id event_handler_callback;
  OS_dispatch_queue *v10;
  OS_dispatch_queue *signing_queue;
  OS_dispatch_queue *v12;
  OS_dispatch_queue *send_queue;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *recv_queue;
  OS_dispatch_queue *v16;
  OS_dispatch_queue *nw_conn_queue;
  OS_dispatch_queue *v18;
  OS_dispatch_queue *timer_queue;
  NSObject *v20;
  OS_dispatch_source *v21;
  OS_dispatch_source *timer;
  NSObject *v23;
  dispatch_time_t v24;
  NSObject *v25;
  uint64_t v26;
  OS_dispatch_semaphore *v27;
  OS_dispatch_semaphore *timer_semaphore;
  NSObject *v29;
  OS_nw_endpoint *host;
  OS_nw_endpoint *endpoint;
  NSObject *v32;
  OS_nw_connection *v33;
  OS_nw_connection *connection;
  NSObject *v35;
  OS_nw_connection *v36;
  OS_dispatch_semaphore *v37;
  OS_dispatch_semaphore *event_semaphore;
  NSObject *v39;
  NSObject *v40;
  _BOOL8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BOOL8 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _BOOL8 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BOOL8 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _BOOL8 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _BOOL8 v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _BOOL8 v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _BOOL8 v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  id v107;
  _BOOL8 v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  _BOOL8 v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  _BOOL8 v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  _QWORD v132[5];
  _QWORD v133[10];
  _QWORD v134[5];
  _QWORD v135[5];
  _QWORD handler[4];
  id v137;
  id location;
  uint8_t buf[24];
  char port[8];
  uint64_t v141;
  uint64_t v142;
  char v143;
  uint64_t v144;

  v144 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_initWeak(&location, self);
  *(_QWORD *)port = 0;
  v141 = 0;
  v143 = 0;
  v142 = 0;
  objc_storeStrong((id *)&self->pd, a3);
  self->_resp_wait_timeout = 35;
  v6 = pthread_mutex_init(&self->io_rqlock, 0);
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBSocket openSocket:].cold.15();
    goto LABEL_42;
  }
  v6 = pthread_mutex_init(&self->skt_lock, 0);
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBSocket openSocket:].cold.14();
    pthread_mutex_destroy(&self->io_rqlock);
    goto LABEL_42;
  }
  v6 = pthread_cond_init(&self->skt_lock_cond, 0);
  if (!v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    io_rqlist = self->io_rqlist;
    self->io_rqlist = v7;

    if (self->io_rqlist)
    {
      pthread_mutex_lock(&self->skt_lock);
      self->state |= 1uLL;
      event_handler_callback = self->event_handler_callback;
      self->event_handler_callback = 0;

      v10 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SMBClientEngine.sign", MEMORY[0x24BDAC9C0]);
      signing_queue = self->_signing_queue;
      self->_signing_queue = v10;

      if (self->_signing_queue)
      {
        v12 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SMBClientEngine.send", 0);
        send_queue = self->send_queue;
        self->send_queue = v12;

        if (self->send_queue)
        {
          v14 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SMBClientEngine.recv", MEMORY[0x24BDAC9C0]);
          recv_queue = self->_recv_queue;
          self->_recv_queue = v14;

          if (self->_recv_queue)
          {
            v16 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SMBClientEngine.read_skt", 0);
            nw_conn_queue = self->nw_conn_queue;
            self->nw_conn_queue = v16;

            if (self->nw_conn_queue)
            {
              v18 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SMBClientEngine.timer", 0);
              timer_queue = self->timer_queue;
              self->timer_queue = v18;

              v20 = self->timer_queue;
              if (v20)
              {
                v21 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v20);
                timer = self->timer;
                self->timer = v21;

                v23 = self->timer;
                if (v23)
                {
                  v24 = dispatch_walltime(0, 0);
                  dispatch_source_set_timer(v23, v24, 0x77359400uLL, 0xEE6B280uLL);
                  v25 = self->timer;
                  v26 = MEMORY[0x24BDAC760];
                  handler[0] = MEMORY[0x24BDAC760];
                  handler[1] = 3221225472;
                  handler[2] = __24__SMBSocket_openSocket___block_invoke;
                  handler[3] = &unk_24FE017A8;
                  objc_copyWeak(&v137, &location);
                  dispatch_source_set_event_handler(v25, handler);
                  v27 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
                  timer_semaphore = self->timer_semaphore;
                  self->timer_semaphore = v27;

                  if (self->timer_semaphore)
                  {
                    v29 = self->timer;
                    v135[0] = v26;
                    v135[1] = 3221225472;
                    v135[2] = __24__SMBSocket_openSocket___block_invoke_6;
                    v135[3] = &unk_24FE017D0;
                    v135[4] = self;
                    dispatch_source_set_cancel_handler(v29, v135);
                    __snprintf_chk(port, 0x19uLL, 0, 0x19uLL, "%d", self->_port);
                    host = (OS_nw_endpoint *)nw_endpoint_create_host(-[NSString cStringUsingEncoding:](self->_serverName, "cStringUsingEncoding:", 4), port);
                    endpoint = self->endpoint;
                    self->endpoint = host;

                    if (!self->endpoint)
                    {
                      v6 = *__error();
                      v106 = MEMORY[0x24BDACB70];
                      v107 = MEMORY[0x24BDACB70];
                      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
                        -[SMBSocket openSocket:].cold.9((uint64_t)-[NSString cStringUsingEncoding:](self->_serverName, "cStringUsingEncoding:", 4), buf);

                      pthread_mutex_unlock(&self->skt_lock);
                      -[SMBSocket closeSocket](self, "closeSocket");
                      goto LABEL_56;
                    }
                    v32 = nw_parameters_create();
                    if (v32)
                    {
                      nw_parameters_set_data_mode();
                      nw_parameters_set_no_delay();
                      nw_parameters_set_keepalive_enabled();
                      v33 = (OS_nw_connection *)nw_connection_create((nw_endpoint_t)self->endpoint, v32);
                      connection = self->_connection;
                      self->_connection = v33;

                      v35 = self->_connection;
                      if (v35)
                      {
                        nw_connection_set_queue(v35, (dispatch_queue_t)self->nw_conn_queue);
                        v36 = self->_connection;
                        v134[0] = v26;
                        v134[1] = 3221225472;
                        v134[2] = __24__SMBSocket_openSocket___block_invoke_8;
                        v134[3] = &unk_24FE017F8;
                        v134[4] = self;
                        MEMORY[0x2348B61DC](v36, v134);
                        v133[5] = v26;
                        v133[6] = 3221225472;
                        v133[7] = __24__SMBSocket_openSocket___block_invoke_10;
                        v133[8] = &unk_24FE017D0;
                        v133[9] = self;
                        nw_connection_set_cancel_handler();
                        v37 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
                        event_semaphore = self->event_semaphore;
                        self->event_semaphore = v37;

                        if (self->event_semaphore)
                        {
                          v39 = self->_connection;
                          v133[0] = v26;
                          v133[1] = 3221225472;
                          v133[2] = __24__SMBSocket_openSocket___block_invoke_11;
                          v133[3] = &unk_24FE01820;
                          v133[4] = self;
                          nw_connection_set_viability_changed_handler(v39, v133);
                          v40 = self->_connection;
                          v132[0] = v26;
                          v132[1] = 3221225472;
                          v132[2] = __24__SMBSocket_openSocket___block_invoke_2;
                          v132[3] = &unk_24FE01820;
                          v132[4] = self;
                          nw_connection_set_better_path_available_handler(v40, v132);
                          nw_connection_set_read_close_handler();
                          nw_connection_set_write_close_handler();
                          pthread_mutex_unlock(&self->skt_lock);
                          v6 = 0;
LABEL_56:
                          objc_destroyWeak(&v137);
                          goto LABEL_42;
                        }
                        v124 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                        if (v124)
                          -[SMBSocket openSocket:].cold.12(v124, v125, v126, v127, v128, v129, v130, v131);
                        pthread_mutex_unlock(&self->skt_lock);
                        -[SMBSocket closeSocket](self, "closeSocket");
LABEL_46:
                        v6 = 12;
                        goto LABEL_56;
                      }
                      v6 = *__error();
                      v116 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                      if (v116)
                        -[SMBSocket openSocket:].cold.11(v116, v117, v118, v119, v120, v121, v122, v123);
                    }
                    else
                    {
                      v6 = *__error();
                      v108 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                      if (v108)
                        -[SMBSocket openSocket:].cold.10(v108, v109, v110, v111, v112, v113, v114, v115);
                    }
                    pthread_mutex_unlock(&self->skt_lock);
                    -[SMBSocket closeSocket](self, "closeSocket");
                    goto LABEL_56;
                  }
                  v98 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                  if (v98)
                    -[SMBSocket openSocket:].cold.8(v98, v99, v100, v101, v102, v103, v104, v105);
                  pthread_mutex_unlock(&self->skt_lock);
                  -[SMBSocket closeSocket](self, "closeSocket");
                  goto LABEL_46;
                }
                v89 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                if (v89)
                  -[SMBSocket openSocket:].cold.7(v89, v90, v91, v92, v93, v94, v95, v96);
              }
              else
              {
                v81 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                if (v81)
                  -[SMBSocket openSocket:].cold.6(v81, v82, v83, v84, v85, v86, v87, v88);
              }
            }
            else
            {
              v73 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (v73)
                -[SMBSocket openSocket:].cold.5(v73, v74, v75, v76, v77, v78, v79, v80);
            }
          }
          else
          {
            v65 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v65)
              -[SMBSocket openSocket:].cold.4(v65, v66, v67, v68, v69, v70, v71, v72);
          }
        }
        else
        {
          v57 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v57)
            -[SMBSocket openSocket:].cold.3(v57, v58, v59, v60, v61, v62, v63, v64);
        }
      }
      else
      {
        v49 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v49)
          -[SMBSocket openSocket:].cold.2(v49, v50, v51, v52, v53, v54, v55, v56);
      }
      pthread_mutex_unlock(&self->skt_lock);
      -[SMBSocket closeSocket](self, "closeSocket");
    }
    else
    {
      v41 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v41)
        -[SMBSocket openSocket:].cold.1(v41, v42, v43, v44, v45, v46, v47, v48);
      pthread_mutex_destroy(&self->io_rqlock);
      pthread_mutex_destroy(&self->skt_lock);
      pthread_cond_destroy(&self->skt_lock_cond);
    }
    v6 = 12;
    goto LABEL_42;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[SMBSocket openSocket:].cold.13();
  pthread_mutex_destroy(&self->io_rqlock);
  pthread_mutex_destroy(&self->skt_lock);
LABEL_42:
  objc_destroyWeak(&location);

  return v6;
}

void __24__SMBSocket_openSocket___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "timeOutCheck");

}

intptr_t __24__SMBSocket_openSocket___block_invoke_6(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 344));
}

void __24__SMBSocket_openSocket___block_invoke_8(uint64_t a1, int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  int error_code;
  BOOL v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v6 + 208));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) |= 0x80uLL;
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
    if (v5)
    {
      error_code = nw_error_get_error_code(v5);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __24__SMBSocket_openSocket___block_invoke_8_cold_2();
      v8 = error_code == 61;
    }
    else
    {
      v8 = 0;
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = a2;
    if (a2 != 4 && v8)
      a2 = 4;
    if (a2 == 3)
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) |= 2uLL;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) &= ~0x20uLL;
      pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
      while (dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40)))
        ;
    }
    else if ((a2 & 0xFFFFFFFE) == 4)
    {
      pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) |= 0x20uLL;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) &= ~2uLL;
      pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
      smb_rq_cancel_all_requests((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 128), *(void **)(*(_QWORD *)(a1 + 32) + 192), (_DWORD *)(*(_QWORD *)(a1 + 32) + 336), *(void **)(*(_QWORD *)(a1 + 32) + 328), *(void **)(*(_QWORD *)(a1 + 32) + 384));
      if (a2 != 5)
        nw_connection_cancel(*(nw_connection_t *)(*(_QWORD *)(a1 + 32) + 376));
      smb2_rq_credit_start(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "getSessionPtr"), 0xFFFF);
      while (dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40)))
        ;
    }
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) &= ~0x80uLL;
    pthread_cond_signal((pthread_cond_t *)(*(_QWORD *)(a1 + 32) + 272));
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
  }
  else
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
      __24__SMBSocket_openSocket___block_invoke_8_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

void __24__SMBSocket_openSocket___block_invoke_10(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v1 + 208));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) |= 0x100uLL;
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
    smb_rq_cancel_all_requests((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 128), *(void **)(*(_QWORD *)(a1 + 32) + 192), (_DWORD *)(*(_QWORD *)(a1 + 32) + 336), *(void **)(*(_QWORD *)(a1 + 32) + 328), *(void **)(*(_QWORD *)(a1 + 32) + 384));
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = 5;
    smb2_rq_credit_start(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "getSessionPtr"), 0xFFFF);
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) &= ~0x100uLL;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) |= 0x200uLL;
    pthread_cond_signal((pthread_cond_t *)(*(_QWORD *)(a1 + 32) + 272));
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
  }
  else
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v3)
      __24__SMBSocket_openSocket___block_invoke_8_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void __24__SMBSocket_openSocket___block_invoke_11(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  int v25;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 208));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) |= 0x400uLL;
    if ((piston_log_level & 8) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __24__SMBSocket_openSocket___block_invoke_11_cold_3();
    v5 = 4;
    if (a2)
      v5 = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) & 0xFFFFFFFFFFFFFFFBLL | v5;
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
    v6 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v6 + 352))
    {
      v7 = *(NSObject **)(v6 + 384);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __24__SMBSocket_openSocket___block_invoke_14;
      v24[3] = &unk_24FE01758;
      v24[4] = v6;
      v25 = a2;
      dispatch_async(v7, v24);
    }
    else if ((piston_log_level & 8) != 0)
    {
      v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v16)
        __24__SMBSocket_openSocket___block_invoke_11_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) &= ~0x400uLL;
    pthread_cond_signal((pthread_cond_t *)(*(_QWORD *)(a1 + 32) + 272));
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
  }
  else
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
      __24__SMBSocket_openSocket___block_invoke_8_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
}

uint64_t __24__SMBSocket_openSocket___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 352), 2, 0, *(unsigned int *)(a1 + 40));
}

void __24__SMBSocket_openSocket___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v5;
  NSObject *v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  int v24;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 208));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) |= 0x800uLL;
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
    if ((piston_log_level & 8) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __24__SMBSocket_openSocket___block_invoke_2_cold_3();
    v5 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v5 + 352))
    {
      v6 = *(NSObject **)(v5 + 384);
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __24__SMBSocket_openSocket___block_invoke_16;
      v23[3] = &unk_24FE01758;
      v23[4] = v5;
      v24 = a2;
      dispatch_async(v6, v23);
    }
    else if ((piston_log_level & 8) != 0)
    {
      v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v15)
        __24__SMBSocket_openSocket___block_invoke_2_cold_2(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) &= ~0x800uLL;
    pthread_cond_signal((pthread_cond_t *)(*(_QWORD *)(a1 + 32) + 272));
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      __24__SMBSocket_openSocket___block_invoke_2_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

uint64_t __24__SMBSocket_openSocket___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 352), 4, 0, *(unsigned int *)(a1 + 40));
}

void __24__SMBSocket_openSocket___block_invoke_2_17(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if ((piston_log_level & 8) != 0)
    {
      v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v3)
        __24__SMBSocket_openSocket___block_invoke_2_17_cold_3(v3, v4, v5, v6, v7, v8, v9, v10);
      v1 = *(_QWORD *)(a1 + 32);
    }
    pthread_mutex_lock((pthread_mutex_t *)(v1 + 208));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) |= 0x1000uLL;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) |= 8uLL;
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
    smb_rq_cancel_all_requests((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 128), *(void **)(*(_QWORD *)(a1 + 32) + 192), (_DWORD *)(*(_QWORD *)(a1 + 32) + 336), *(void **)(*(_QWORD *)(a1 + 32) + 328), *(void **)(*(_QWORD *)(a1 + 32) + 384));
    nw_connection_cancel(*(nw_connection_t *)(*(_QWORD *)(a1 + 32) + 376));
    v11 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v11 + 352))
    {
      v12 = *(NSObject **)(v11 + 384);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __24__SMBSocket_openSocket___block_invoke_18;
      block[3] = &unk_24FE017D0;
      block[4] = v11;
      dispatch_async(v12, block);
    }
    else if ((piston_log_level & 8) != 0)
    {
      v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v21)
        __24__SMBSocket_openSocket___block_invoke_2_17_cold_2(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) &= ~0x1000uLL;
    pthread_cond_signal((pthread_cond_t *)(*(_QWORD *)(a1 + 32) + 272));
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
  }
  else
  {
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v13)
      __24__SMBSocket_openSocket___block_invoke_2_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
  }
}

uint64_t __24__SMBSocket_openSocket___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) + 16))();
}

void __24__SMBSocket_openSocket___block_invoke_2_19(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if ((piston_log_level & 8) != 0)
    {
      v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v3)
        __24__SMBSocket_openSocket___block_invoke_2_19_cold_3(v3, v4, v5, v6, v7, v8, v9, v10);
      v1 = *(_QWORD *)(a1 + 32);
    }
    pthread_mutex_lock((pthread_mutex_t *)(v1 + 208));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) |= 0x2000uLL;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) |= 0x10uLL;
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
    v11 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v11 + 352))
    {
      v12 = *(NSObject **)(v11 + 384);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __24__SMBSocket_openSocket___block_invoke_20;
      block[3] = &unk_24FE017D0;
      block[4] = v11;
      dispatch_async(v12, block);
    }
    else if ((piston_log_level & 8) != 0)
    {
      v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v21)
        __24__SMBSocket_openSocket___block_invoke_2_19_cold_2(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    pthread_mutex_lock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) &= ~0x2000uLL;
    pthread_cond_signal((pthread_cond_t *)(*(_QWORD *)(a1 + 32) + 272));
    pthread_mutex_unlock((pthread_mutex_t *)(*(_QWORD *)(a1 + 32) + 208));
  }
  else
  {
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v13)
      __24__SMBSocket_openSocket___block_invoke_2_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
  }
}

uint64_t __24__SMBSocket_openSocket___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 352) + 16))();
}

- (int)connectSocket
{
  NSObject *event_semaphore;
  dispatch_time_t v4;
  intptr_t v5;
  int nw_conn_state;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  OS_nw_endpoint *v15;
  OS_nw_endpoint *remote_endpoint;
  NSObject *address;
  __darwin_time_t tv_sec;
  uint64_t v19;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  timeval v29;

  nw_connection_start((nw_connection_t)self->_connection);
  event_semaphore = self->event_semaphore;
  v4 = dispatch_time(0, 1000000000 * self->_connectTimeOut);
  v5 = dispatch_semaphore_wait(event_semaphore, v4);
  nw_conn_state = self->nw_conn_state;
  if (v5)
  {
    if (nw_conn_state == 3)
    {
      v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v7)
        -[SMBSocket connectSocket].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
LABEL_11:
      -[SMBSocket closeSocket](self, "closeSocket");
      return 57;
    }
LABEL_9:
    v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v21)
      -[SMBSocket connectSocket].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_11;
  }
  if (nw_conn_state != 3)
    goto LABEL_9;
  v15 = (OS_nw_endpoint *)nw_connection_copy_connected_remote_endpoint();
  remote_endpoint = self->remote_endpoint;
  self->remote_endpoint = v15;

  address = self->remote_endpoint;
  if (address)
    address = nw_endpoint_get_address(address);
  v29.tv_sec = 0;
  *(_QWORD *)&v29.tv_usec = 0;
  self->server_addr = (const sockaddr *)address;
  -[SMBSocket readNBHeader](self, "readNBHeader", v29.tv_sec, *(_QWORD *)&v29.tv_usec);
  gettimeofday(&v29, 0);
  tv_sec = v29.tv_sec;
  v19 = 1000 * v29.tv_usec;
  self->_last_recv.tv_sec = v29.tv_sec;
  self->_last_recv.tv_nsec = v19;
  self->_last_echo.tv_sec = tv_sec;
  self->_last_echo.tv_nsec = v19;
  pthread_mutex_lock(&self->io_rqlock);
  dispatch_activate((dispatch_object_t)self->timer);
  dispatch_suspend((dispatch_object_t)self->timer);
  pthread_mutex_unlock(&self->io_rqlock);
  return 0;
}

- (void)closeSocket
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "-[SMBSocket closeSocket]";
  OUTLINED_FUNCTION_2_1(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Cancel attempt timed out \n", a1);
}

- (void)callEventHandler:(unsigned int)a3 contextPtr:(id)a4 returnValue:(unsigned int)a5
{
  (*((void (**)(void))self->event_handler_callback + 2))();
}

- (id)getEventHandler
{
  return (id)MEMORY[0x2348B63BC](self->event_handler_callback, a2);
}

- (char)getIPv4IPv6DotName
{
  return (char *)self->ipv4v6DotName;
}

- (unsigned)getIPv4IPv6DotNameMaxLength
{
  return 46;
}

- (const)getServerAddress
{
  return self->server_addr;
}

- (unsigned)isPerAppVPN
{
  nw_path_t v2;
  unsigned int is_per_app_vpn;

  v2 = nw_connection_copy_current_path((nw_connection_t)self->_connection);
  is_per_app_vpn = nw_path_is_per_app_vpn();

  return is_per_app_vpn;
}

- (void)setEventHandler:(id)a3
{
  void *v4;
  id event_handler_callback;

  v4 = (void *)MEMORY[0x2348B63BC](a3, a2);
  event_handler_callback = self->event_handler_callback;
  self->event_handler_callback = v4;

}

- (int)processReply:(void *)a3
{
  uint64_t v5;
  smb_session *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  int *v16;
  NSMutableArray *io_rqlist;
  NSMutableArray *v18;
  unsigned int *p_session_credits_wait;
  unsigned int v21;
  uint64_t v22;
  unint64_t session_flags;
  __int128 v24;
  __int128 v25;
  NSObject *recv_queue;
  NSObject *v27;
  unint64_t option_flags;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  char *sess_setup_reply;
  unint64_t chain_len;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  _QWORD *v49;
  unint64_t i;
  id v51;
  size_t v52;
  char *v53;
  const void *v54;
  _BOOL8 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BOOL8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  int v72;
  int v73;
  _opaque_pthread_mutex_t *p_io_rqlock;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD block[4];
  id v80;
  uint64_t *v81;
  id v82;
  id v83;
  timeval v84;
  _BOOL4 v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  _OWORD __s2[4];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v91 = a3;
  v87 = 0;
  v88 = &v87;
  v89 = 0x2020000000;
  v90 = 0;
  v86 = 0;
  v85 = 0;
  v84.tv_sec = 0;
  *(_QWORD *)&v84.tv_usec = 0;
  memset(__s2, 0, sizeof(__s2));
  gettimeofday(&v84, 0);
  v5 = 1000 * v84.tv_usec;
  self->_last_recv.tv_sec = v84.tv_sec;
  self->_last_recv.tv_nsec = v5;
  v6 = -[SMBPiston getSessionPtr](self->pd, "getSessionPtr");
  if (*(unsigned __int8 *)mbuf_data((uint64_t)a3) == 253)
  {
    v7 = smb3_msg_decrypt((uint64_t)v6, &v91);
    if (v7)
    {
      mbuf_freem(v91);
      nw_connection_cancel((nw_connection_t)self->_connection);
      v76 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      goto LABEL_49;
    }
  }
  v12 = mbuf_data((uint64_t)v91);
  v13 = *(unsigned __int16 *)(v12 + 12);
  v14 = (uint64_t *)(v12 + 24);
  v15 = *(_QWORD *)(v12 + 24);
  v16 = (int *)(v12 + 8);
  v73 = *(_DWORD *)(v12 + 8);
  v71 = *(_DWORD *)(v12 + 16);
  io_rqlist = self->io_rqlist;
  v83 = 0;
  p_io_rqlock = &self->io_rqlock;
  smb_rq_find(&self->io_rqlock, io_rqlist, v15, &v85, (uint64_t *)&v86, &v83, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v83;
  if (v11)
  {
    v76 = 0;
    goto LABEL_6;
  }
  v76 = 0;
  if ((v6->option_flags & 0x200) != 0 && !v85)
  {
    v18 = self->io_rqlist;
    v82 = 0;
    smb_rq_find_cmpd(p_io_rqlock, v18, v15, &v82);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v76 = v82;
    if (v11)
    {
LABEL_6:
      pthread_mutex_lock(&v6->session_credits_lock);
      if (v85)
      {
        v6->session_req_pending = 0;
        if (!v6->session_oldest_message_id)
          goto LABEL_27;
        v6->session_oldest_message_id = 0;
      }
      else
      {
        v6->session_req_pending = 1;
        if ((*(_BYTE *)(v12 + 16) & 2) != 0 || v86 == v6->session_oldest_message_id)
          goto LABEL_27;
        v6->session_oldest_message_id = v86;
      }
      p_session_credits_wait = (unsigned int *)&v6->session_credits_wait;
      if (atomic_load((unsigned int *)&v6->session_credits_wait))
      {
        do
          v21 = __ldaxr(p_session_credits_wait);
        while (__stlxr(v21 - 1, p_session_credits_wait));
        pthread_cond_signal(&v6->session_credits_wait_cond);
      }
LABEL_27:
      pthread_mutex_unlock(&v6->session_credits_lock);
      if ((*(_BYTE *)(v12 + 16) & 2) != 0 && *v16 == 259)
      {
        smb_rq_handle_async_pending(v11, v12);
        mbuf_freem(v91);
        v8 = 0;
        v9 = 0;
LABEL_30:
        v7 = 0;
        goto LABEL_49;
      }
      v22 = objc_msgSend(v11, "smb_rq_getreply");
      v88[3] = v22;
      md_initm(v22, (uint64_t)v91);
      objc_msgSend(v11, "smb_rq_set_extflag:", 2);
      v11 = v11;
      if ((objc_msgSend(v11, "sr_flags") & 0x100) != 0 && !*(_DWORD *)(v12 + 20))
      {
        option_flags = v6->option_flags;
        if ((option_flags & 0x200) == 0)
        {
          if (piston_log_level)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[SMBSocket processReply:].cold.5(v13, v15, v30, v31, v32, v33, v34, v35);
            option_flags = v6->option_flags;
          }
          v6->option_flags = option_flags | 0x200;
        }
        if (v76)
        {
          v36 = v76;
          v8 = v36;
          while ((objc_msgSend(v8, "sr_extflags") & 2) != 0)
          {
            objc_msgSend(v8, "sr_next_rqp");
            v37 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v37;
            if (!v37)
            {
              v75 = v36;

              v38 = objc_msgSend(v75, "smb_rq_getreply");
              v8 = 0;
              v88[3] = v38;
              v72 = 1;
              goto LABEL_35;
            }
          }
        }
        else
        {
          v8 = 0;
        }
        v72 = 0;
      }
      else
      {
        v8 = 0;
        v72 = 1;
      }
      v75 = v11;
LABEL_35:
      if (v13 == 1)
      {
        session_flags = v6->session_flags;
        if ((session_flags & 0x20000) == 0 || v73 != -1073741802)
        {
          if ((session_flags & 0x28800) != 0 && !v73 && (v71 & 8) != 0)
          {
            sess_setup_reply = v6->sess_setup_reply;
            if (sess_setup_reply)
              free(sess_setup_reply);
            chain_len = mbuf_get_chain_len((uint64_t)v91);
            if (chain_len > 0x10000)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[SMBSocket processReply:].cold.4(chain_len, v41, v42, v43, v44, v45, v46, v47);
              chain_len = 0x10000;
            }
            v48 = (char *)malloc_type_malloc(chain_len, 0xF14EDA36uLL);
            v6->sess_setup_reply = v48;
            if (v48)
            {
              v6->sess_setup_reply_len = chain_len;
              v6->sess_setup_message_id = v15;
              v49 = v91;
              if (v91 && chain_len)
              {
                for (i = 0; i < chain_len; i += v52)
                {
                  v51 = v10;
                  v52 = mbuf_len((uint64_t)v49);
                  v53 = v6->sess_setup_reply;
                  v54 = (const void *)mbuf_data((uint64_t)v49);
                  if (v52 + i > chain_len)
                    v52 = chain_len - i;
                  memcpy(&v53[i], v54, v52);
                  v49 = (_QWORD *)mbuf_next((uint64_t)v49);
                  v10 = v51;
                  if (!v49)
                    break;
                }
              }
            }
            else
            {
              v55 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (v55)
                -[SMBSocket processReply:].cold.3(v55, v56, v57, v58, v59, v60, v61, v62);
            }
          }
          goto LABEL_44;
        }
      }
      else if ((_BYTE)v13 || !memcmp(v6->pre_auth_int_hash, __s2, 0x40uLL))
      {
LABEL_44:
        if (v72)
        {
          smb_rq_dequeue(p_io_rqlock, self->io_rqlist, &self->timer_running, self->timer, v75);
          recv_queue = self->_recv_queue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __26__SMBSocket_processReply___block_invoke;
          block[3] = &unk_24FE01888;
          v75 = v75;
          v80 = v75;
          v81 = &v87;
          dispatch_async(recv_queue, block);

        }
        goto LABEL_46;
      }
      smb311_pre_auth_integrity_hash_update((uint64_t)v6, (uint64_t)v91);
      if (!(_BYTE)v13)
      {
        v24 = *(_OWORD *)&v6->pre_auth_int_hash[16];
        *(_OWORD *)v6->pre_auth_int_hash_neg = *(_OWORD *)v6->pre_auth_int_hash;
        *(_OWORD *)&v6->pre_auth_int_hash_neg[16] = v24;
        v25 = *(_OWORD *)&v6->pre_auth_int_hash[48];
        *(_OWORD *)&v6->pre_auth_int_hash_neg[32] = *(_OWORD *)&v6->pre_auth_int_hash[32];
        *(_OWORD *)&v6->pre_auth_int_hash_neg[48] = v25;
      }
      smb311_pre_auth_integrity_hash_print((uint64_t)v6);
      goto LABEL_44;
    }
  }
  if (v13 != 13)
  {
    if (v13 == 18 && *v14 == -1 && !*(_DWORD *)(v12 + 36))
    {
      if (self->event_handler_callback)
      {
        smb2_smb_parse_lease_break(self->pd, v91);
        v8 = 0;
        v9 = 0;
        v11 = 0;
        goto LABEL_30;
      }
      v63 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v63)
        -[SMBSocket processReply:].cold.2(v63, v64, v65, v66, v67, v68, v69, v70);
    }
    if (((*(_BYTE *)(v12 + 16) & 2) == 0 || *v16 != 259) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBSocket processReply:].cold.1(v14, (unsigned __int16 *)(v12 + 12), v16);
  }
  mbuf_freem(v91);
  v11 = 0;
  v8 = 0;
  v75 = 0;
LABEL_46:
  if (v10)
  {
    smb_rq_dequeue(p_io_rqlock, self->io_rqlist, &self->timer_running, self->timer, v10);
    v27 = self->_recv_queue;
    v77[0] = MEMORY[0x24BDAC760];
    v77[1] = 3221225472;
    v77[2] = __26__SMBSocket_processReply___block_invoke_21;
    v77[3] = &unk_24FE017D0;
    v78 = v10;
    dispatch_async(v27, v77);

    v10 = 0;
  }
  v7 = 0;
  v9 = v75;
LABEL_49:

  _Block_object_dispose(&v87, 8);
  return v7;
}

uint64_t __26__SMBSocket_processReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "smb_rq_callback:", smb2_rq_parse_header(*(void **)(a1 + 32), (__int128 **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)));
}

uint64_t __26__SMBSocket_processReply___block_invoke_21(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "smb_rq_callback:", 60);
}

- (void)readData:(const void *)a3
{
  size_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  int v14;
  id location;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  objc_initWeak(&location, self);
  v4 = bswap32(*(_DWORD *)a3);
  if (BYTE3(v4))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBSocket readData:].cold.3();
  }
  else if (smb_mbuf_get(0, 1, v17 + 3, v4))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[SMBSocket readData:].cold.2();
  }
  else
  {
    mbuf_data(v17[3]);
    v14 = v4;
    objc_copyWeak(&v13, &location);
    if ((nw_connection_read_buffer() & 1) == 0)
    {
      v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v5)
        -[SMBSocket readData:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);
}

void __22__SMBSocket_readData___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained;
  id v6;

  if (a3)
  {
    if (a3 != 57 && a3 != 89 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __22__SMBSocket_readData___block_invoke_cold_1(a3);
  }
  else
  {
    mbuf_setlen(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), *(unsigned int *)(a1 + 48));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "processReply:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

  }
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "readNBHeader");

}

- (void)readNBHeader
{
  NSObject *connection;
  _QWORD v4[6];
  id v5;
  _QWORD v6[4];
  _QWORD v7[3];
  int v8;
  id location;

  objc_initWeak(&location, self);
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  connection = self->_connection;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __25__SMBSocket_readNBHeader__block_invoke;
  v4[3] = &unk_24FE01900;
  v4[4] = v7;
  v4[5] = v6;
  objc_copyWeak(&v5, &location);
  nw_connection_receive(connection, 4u, 4u, v4);
  objc_destroyWeak(&v5);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(v7, 8);
  objc_destroyWeak(&location);
}

void __25__SMBSocket_readNBHeader__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  int error_code;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD applier[4];
  __int128 v22;
  id v23;

  v8 = a2;
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    error_code = nw_error_get_error_code(v10);
    if (!v8)
      goto LABEL_8;
  }
  else
  {
    error_code = 0;
    if (!v8)
      goto LABEL_8;
  }
  if (dispatch_data_get_size(v8) && !error_code)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __25__SMBSocket_readNBHeader__block_invoke_23;
    applier[3] = &unk_24FE018D8;
    v22 = *(_OWORD *)(a1 + 32);
    objc_copyWeak(&v23, (id *)(a1 + 48));
    dispatch_data_apply(v8, applier);
    objc_destroyWeak(&v23);
    goto LABEL_18;
  }
LABEL_8:
  if (error_code)
  {
    if (error_code != 57 && error_code != 89 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __25__SMBSocket_readNBHeader__block_invoke_cold_1(error_code);
  }
  else
  {
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v13)
        __25__SMBSocket_readNBHeader__block_invoke_cold_3(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    else if (v13)
    {
      __25__SMBSocket_readNBHeader__block_invoke_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
LABEL_18:

}

uint64_t __25__SMBSocket_readNBHeader__block_invoke_23(uint64_t a1, void *a2, uint64_t a3, const void *a4, size_t a5)
{
  id v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;

  v8 = a2;
  if (a5 == 4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v10 = WeakRetained;
    v11 = (uint64_t)a4;
LABEL_7:
    objc_msgSend(WeakRetained, "readData:", v11);

    goto LABEL_8;
  }
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + v12;
  v14 = 4 - v12;
  if (v14 < a5)
    a5 = v14;
  memcpy((void *)(v13 + 24), a4, a5);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += a5;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 4)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v10 = WeakRetained;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24;
    goto LABEL_7;
  }
LABEL_8:

  return 1;
}

- (int)send:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t *v36;
  uint64_t v37;
  size_t v38;
  void *v39;
  _DWORD *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BOOL8 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  int v65;
  id v66;
  NSObject *v67;
  dispatch_data_t v68;
  uint64_t v69;
  const void *v70;
  size_t v71;
  NSObject *v72;
  NSObject *concat;
  NSObject *v74;
  dispatch_data_t v75;
  NSObject *connection;
  NSObject *v77;
  _QWORD completion[4];
  id v79;
  SMBSocket *v80;
  uint64_t *v81;
  uint64_t *v82;
  void *buffer;
  id location;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  size_t v93;
  _QWORD v94[2];

  v94[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v93 = 0;
  v89 = 0;
  v90 = &v89;
  v91 = 0x2020000000;
  v92 = 0;
  v85 = 0;
  v86 = &v85;
  v87 = 0x2020000000;
  v88 = 0;
  objc_initWeak(&location, self);
  buffer = 0;
  v94[0] = 0;
  if (!v4)
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v11)
      -[SMBSocket send:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_39;
  }
  v5 = objc_msgSend(v4, "sr_sessionp");
  if (!v5)
  {
    v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v19)
      -[SMBSocket send:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);
    goto LABEL_39;
  }
  v6 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
  v86[3] = (uint64_t)v6;
  if (v6)
  {
    if ((objc_msgSend(v4, "sr_flags") & 0x100) != 0)
    {
      v36 = (uint64_t *)objc_msgSend(v4, "smb_rq_getrequest");
      if (v36)
      {
        v37 = mb_detach(v36);
        v90[3] = v37;
        objc_msgSend(v4, "sr_next_rqp");
        v38 = 0;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          do
          {
            v40 = (_DWORD *)mb_detach((uint64_t *)objc_msgSend(v39, "smb_rq_getrequest"));
            if (v40)
            {
              v41 = mbuf_concatenate(v90[3], v40);
              v90[3] = v41;
            }
            if (objc_msgSend(v39, "sr_command") == 9
              && !objc_msgSend(v39, "onEncryptedShare"))
            {
              v38 += objc_msgSend(v39, "writeLen");
              v93 = v38;
              objc_msgSend(v39, "writeData");
              v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              mbuf_set_write((uint64_t)v40, objc_msgSend(v42, "bytes"), objc_msgSend(v39, "writeLen"));

              if ((objc_msgSend(v39, "sr_flags") & 0x100) != 0 && (objc_msgSend(v39, "writeLen") & 7) != 0)
              {
                v38 += 8 - (objc_msgSend(v39, "writeLen") & 7);
                v93 = v38;
              }
            }
            objc_msgSend(v39, "sr_next_rqp");
            v43 = objc_claimAutoreleasedReturnValue();

            v39 = (void *)v43;
          }
          while (v43);
        }
        v9 = v38 + m_fixhdr(v90[3]);
        goto LABEL_46;
      }
      v44 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (!v44)
        goto LABEL_38;
    }
    else
    {
      v7 = (uint64_t *)objc_msgSend(v4, "smb_rq_getrequest");
      v8 = v7;
      if (v7)
      {
        if (*v7)
        {
          v9 = mb_fixhdr(v7);
          v10 = mb_detach(v8);
          v90[3] = v10;
          if (!objc_msgSend(v4, "sr_command") && (*(_BYTE *)(v5 + 561) & 0x10) != 0)
          {
            smb311_pre_auth_integrity_hash_init(v5, 0, v90[3]);
            smb311_pre_auth_integrity_hash_print(v5);
          }
          if (objc_msgSend(v4, "sr_command") == 1 && (*(_BYTE *)(v5 + 554) & 2) != 0)
          {
            if (objc_msgSend(v4, "sr_rqsessionid"))
              smb311_pre_auth_integrity_hash_update(v5, v90[3]);
            else
              smb311_pre_auth_integrity_hash_init(v5, 1, v90[3]);
            smb311_pre_auth_integrity_hash_print(v5);
          }
          if (objc_msgSend(v4, "sr_command") == 9 && !objc_msgSend(v4, "onEncryptedShare"))
          {
            v61 = objc_msgSend(v4, "writeLen");
            v62 = v90[3];
            objc_msgSend(v4, "writeData");
            v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            mbuf_set_write(v62, objc_msgSend(v63, "bytes"), objc_msgSend(v4, "writeLen"));

            v9 += v61;
          }
LABEL_46:
          v64 = v90[3];
          if (v64)
          {
            v65 = 0;
            do
            {
              v64 = mbuf_next(v64);
              ++v65;
            }
            while (v64);
          }
          else
          {
            v65 = 0;
          }
          v66 = objc_loadWeakRetained(&location);
          objc_msgSend(v66, "setNetBIOSHeader:nbType:length:", v86[3], 0, v9);

          smb_rq_set_time_sent(v4, 0);
          v67 = dispatch_data_create((const void *)v86[3], 4uLL, 0, 0);
          v68 = 0;
          if (v65)
          {
            v69 = v90[3];
            do
            {
              v70 = (const void *)mbuf_data(v69);
              v71 = mbuf_len(v69);
              v72 = dispatch_data_create(v70, v71, 0, 0);

              concat = dispatch_data_create_concat(v67, v72);
              if (mbuf_is_write(v69, &buffer, &v93))
              {
                v74 = dispatch_data_create(buffer, v93, 0, 0);

                v67 = dispatch_data_create_concat(concat, v74);
                if ((objc_msgSend(v4, "sr_flags") & 0x100) != 0 && (v93 & 7) != 0)
                {
                  v68 = dispatch_data_create(v94, 8 - (v93 & 7), 0, 0);

                  v75 = dispatch_data_create_concat(v67, v68);
                  v67 = v75;
                }
                else
                {
                  v68 = v74;
                }
              }
              else
              {
                v67 = concat;
                v68 = v72;
              }
              v69 = mbuf_next(v69);
              --v65;
            }
            while (v65);
          }
          connection = self->_connection;
          v77 = *MEMORY[0x24BDE0860];
          completion[0] = MEMORY[0x24BDAC760];
          completion[1] = 3221225472;
          completion[2] = __18__SMBSocket_send___block_invoke;
          completion[3] = &unk_24FE01928;
          v81 = &v85;
          v82 = &v89;
          v79 = v4;
          v80 = self;
          nw_connection_send(connection, v67, v77, 0, completion);

          v35 = 0;
          goto LABEL_40;
        }
        v52 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v52)
          -[SMBSocket send:].cold.5(v52, v53, v54, v55, v56, v57, v58, v59);
        goto LABEL_38;
      }
      v44 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (!v44)
      {
LABEL_38:
        free((void *)v86[3]);
LABEL_39:
        v35 = 22;
        goto LABEL_40;
      }
    }
    -[SMBSocket send:].cold.4(v44, v45, v46, v47, v48, v49, v50, v51);
    goto LABEL_38;
  }
  v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v27)
    -[SMBSocket send:].cold.3(v27, v28, v29, v30, v31, v32, v33, v34);
  v35 = 12;
LABEL_40:
  objc_destroyWeak(&location);
  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v89, 8);

  return v35;
}

void __18__SMBSocket_send___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  _QWORD *v5;
  int error_code;
  int v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  int v12;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v4)
  {
    free(v4);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  v5 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v5)
    mbuf_freem(v5);
  if (v3 && (error_code = nw_error_get_error_code(v3)) != 0)
  {
    v7 = error_code;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __18__SMBSocket_send___block_invoke_cold_1(a1);
    if ((objc_msgSend(*(id *)(a1 + 32), "sr_extflags") & 0x10) == 0)
      smb_rq_dequeue((pthread_mutex_t *)(*(_QWORD *)(a1 + 40) + 128), *(void **)(*(_QWORD *)(a1 + 40) + 192), (_DWORD *)(*(_QWORD *)(a1 + 40) + 336), *(void **)(*(_QWORD *)(a1 + 40) + 328), *(void **)(a1 + 32));
    v8 = *(void **)(a1 + 32);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 384);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __18__SMBSocket_send___block_invoke_26;
    v10[3] = &unk_24FE01758;
    v11 = v8;
    v12 = v7;
    dispatch_async(v9, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "smb_rq_set_extflag:", 4);
  }

}

uint64_t __18__SMBSocket_send___block_invoke_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "smb_rq_callback:", *(unsigned int *)(a1 + 40));
}

- (int)sendRequest:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  _BOOL4 v8;
  NSObject *send_queue;
  NSObject *v10;
  void *v11;
  NSObject *signing_queue;
  _QWORD v14[4];
  id v15;
  SMBSocket *v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  SMBSocket *v23;
  id v24;
  id location;

  v4 = a3;
  v5 = objc_msgSend(v4, "sr_sessionp");
  v6 = objc_msgSend(v4, "sr_command");
  objc_initWeak(&location, self);
  if (self->nw_conn_state != 3)
    goto LABEL_4;
  pthread_mutex_lock(&self->skt_lock);
  if ((self->state & 2) != 0)
  {
    pthread_mutex_unlock(&self->skt_lock);
    smb2_rq_message_id_increment(v4);
    if ((*(_DWORD *)(v5 + 552) & 0x28800) != 0)
    {
      if ((*(_WORD *)(v5 + 68) & 4) != 0)
      {
        v8 = v6 < 2;
      }
      else
      {
        if (v6 <= 3 && v6 != 2)
          goto LABEL_9;
        v8 = objc_msgSend(v4, "onEncryptedShare") == 0;
      }
LABEL_11:
      smb_rq_enqueue(&self->io_rqlock, self->io_rqlist, &self->timer_running, self->timer, v4);
      if (v8)
      {
        if ((*(_BYTE *)(v5 + 552) & 8) == 0 && (objc_msgSend(v4, "sr_flags") & 0x400) == 0)
        {
          send_queue = self->send_queue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __25__SMBSocket_sendRequest___block_invoke_3;
          block[3] = &unk_24FE01950;
          objc_copyWeak(&v20, &location);
          v19 = v4;
          dispatch_async(send_queue, block);

          objc_destroyWeak(&v20);
LABEL_18:
          v7 = 0;
          goto LABEL_19;
        }
        signing_queue = self->_signing_queue;
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __25__SMBSocket_sendRequest___block_invoke;
        v21[3] = &unk_24FE01978;
        v22 = v4;
        v23 = self;
        objc_copyWeak(&v24, &location);
        dispatch_async(signing_queue, v21);
        objc_destroyWeak(&v24);
        v11 = v22;
      }
      else
      {
        v10 = self->_signing_queue;
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __25__SMBSocket_sendRequest___block_invoke_4;
        v14[3] = &unk_24FE01978;
        v15 = v4;
        v16 = self;
        objc_copyWeak(&v17, &location);
        dispatch_async(v10, v14);
        objc_destroyWeak(&v17);
        v11 = v15;
      }

      goto LABEL_18;
    }
LABEL_9:
    v8 = 1;
    goto LABEL_11;
  }
  pthread_mutex_unlock(&self->skt_lock);
LABEL_4:
  v7 = 57;
LABEL_19:
  objc_destroyWeak(&location);

  return v7;
}

void __25__SMBSocket_sendRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  smb2_rq_sign(*(void **)(a1 + 32));
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 200);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __25__SMBSocket_sendRequest___block_invoke_2;
  v3[3] = &unk_24FE01950;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __25__SMBSocket_sendRequest___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "send:", *(_QWORD *)(a1 + 32));

}

void __25__SMBSocket_sendRequest___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "send:", *(_QWORD *)(a1 + 32));

}

void __25__SMBSocket_sendRequest___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  if (smb3_rq_encrypt(*(void **)(a1 + 32)))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __25__SMBSocket_sendRequest___block_invoke_4_cold_1();
    nw_connection_cancel(*(nw_connection_t *)(*(_QWORD *)(a1 + 40) + 376));
  }
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 200);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __25__SMBSocket_sendRequest___block_invoke_28;
  v3[3] = &unk_24FE01950;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void __25__SMBSocket_sendRequest___block_invoke_28(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "send:", *(_QWORD *)(a1 + 32));

}

- (void)setNetBIOSHeader:(unsigned int *)a3 nbType:(unsigned __int8)a4 length:(unsigned int)a5
{
  int v5;

  if (self->is_NetBIOS)
    v5 = 0x1FFFF;
  else
    v5 = 0xFFFFFF;
  *a3 = bswap32(v5 & a5 | (a4 << 24));
}

- (void)timeOutCheck
{
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: No received data after <%d> seconds, breaking connection \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (int)writeEnabled
{
  SMBSocket *v2;
  _opaque_pthread_mutex_t *p_skt_lock;

  v2 = self;
  p_skt_lock = &self->skt_lock;
  pthread_mutex_lock(&self->skt_lock);
  LODWORD(v2) = (v2->state & 0x34) == 0;
  pthread_mutex_unlock(p_skt_lock);
  return (int)v2;
}

- (OS_nw_connection)connection
{
  return (OS_nw_connection *)objc_getProperty(self, a2, 376, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (OS_dispatch_queue)recv_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 384, 1);
}

- (void)setRecv_queue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 384);
}

- (OS_dispatch_queue)signing_queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 392, 1);
}

- (void)setSigning_queue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (NSString)netBiosName
{
  return (NSString *)objc_getProperty(self, a2, 400, 1);
}

- (void)setNetBiosName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (NSString)serverName
{
  return (NSString *)objc_getProperty(self, a2, 408, 1);
}

- (void)setServerName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (unsigned)port
{
  return self->_port;
}

- (void)setPort:(unsigned __int16)a3
{
  self->_port = a3;
}

- (unsigned)connectTimeOut
{
  return self->_connectTimeOut;
}

- (void)setConnectTimeOut:(unsigned int)a3
{
  self->_connectTimeOut = a3;
}

- (timespec)last_recv
{
  __darwin_time_t v2;
  uint64_t v3;
  _QWORD v4[2];
  timespec result;

  objc_copyStruct(v4, &self->_last_recv, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.tv_nsec = v3;
  result.tv_sec = v2;
  return result;
}

- (void)setLast_recv:(timespec)a3
{
  timespec v3;

  v3 = a3;
  objc_copyStruct(&self->_last_recv, &v3, 16, 1, 0);
}

- (timespec)last_echo
{
  __darwin_time_t v2;
  uint64_t v3;
  _QWORD v4[2];
  timespec result;

  objc_copyStruct(v4, &self->_last_echo, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.tv_nsec = v3;
  result.tv_sec = v2;
  return result;
}

- (void)setLast_echo:(timespec)a3
{
  timespec v3;

  v3 = a3;
  objc_copyStruct(&self->_last_echo, &v3, 16, 1, 0);
}

- (unsigned)resp_wait_timeout
{
  return self->_resp_wait_timeout;
}

- (void)setResp_wait_timeout:(unsigned int)a3
{
  self->_resp_wait_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverName, 0);
  objc_storeStrong((id *)&self->_netBiosName, 0);
  objc_storeStrong((id *)&self->_signing_queue, 0);
  objc_storeStrong((id *)&self->_recv_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->event_handler_callback, 0);
  objc_storeStrong((id *)&self->timer_semaphore, 0);
  objc_storeStrong((id *)&self->timer, 0);
  objc_storeStrong((id *)&self->timer_queue, 0);
  objc_storeStrong((id *)&self->send_queue, 0);
  objc_storeStrong((id *)&self->io_rqlist, 0);
  objc_storeStrong((id *)&self->nw_conn_queue, 0);
  objc_storeStrong((id *)&self->event_semaphore, 0);
  objc_storeStrong((id *)&self->remote_endpoint, 0);
  objc_storeStrong((id *)&self->endpoint, 0);
  objc_storeStrong((id *)&self->pd, 0);
}

- (void)openSocket:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: failed to create NSMutableArray \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openSocket:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: dispatch_queue_create failed for sign\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openSocket:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: dispatch_queue_create failed for send\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openSocket:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: dispatch_queue_create failed for recv\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openSocket:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: dispatch_queue_create failed for nw_connection\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openSocket:(uint64_t)a3 .cold.6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: dispatch_queue_create failed for timer\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openSocket:(uint64_t)a3 .cold.7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: dispatch_source_create failed for timer\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openSocket:(uint64_t)a3 .cold.8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: dispatch_semaphore_create failed for timer semaphore\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openSocket:(uint64_t)a1 .cold.9(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)(buf + 4) = "-[SMBSocket openSocket:]";
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: nw_endpoint_create_host failed for <%s> \n", buf, 0x16u);
}

- (void)openSocket:(uint64_t)a3 .cold.10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: nw_parameters_create failed \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openSocket:(uint64_t)a3 .cold.11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: nw_connection_create failed \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openSocket:(uint64_t)a3 .cold.12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: dispatch_semaphore_create failed for event semaphore\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openSocket:.cold.13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: pthread_cond_init failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openSocket:.cold.14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: pthread_mutex_init failed for skt <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)openSocket:.cold.15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: pthread_mutex_init failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __24__SMBSocket_openSocket___block_invoke_8_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: self is null? \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __24__SMBSocket_openSocket___block_invoke_8_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Event failed with <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __24__SMBSocket_openSocket___block_invoke_11_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: No event callback, thus ignoring viability change \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __24__SMBSocket_openSocket___block_invoke_11_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Viable: %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __24__SMBSocket_openSocket___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: self is null? \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __24__SMBSocket_openSocket___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: No event callback, thus ignoring better path change \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __24__SMBSocket_openSocket___block_invoke_2_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Better Path Available: %s\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __24__SMBSocket_openSocket___block_invoke_2_17_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: No event callback, thus ignoring read close event \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __24__SMBSocket_openSocket___block_invoke_2_17_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Read close event (Server TCP FIN received) \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __24__SMBSocket_openSocket___block_invoke_2_19_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: No event callback, thus ignoring write close event \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __24__SMBSocket_openSocket___block_invoke_2_19_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Write close event\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)connectSocket
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: connection attempt timed out \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)processReply:(int *)a3 .cold.1(uint64_t *a1, unsigned __int16 *a2, int *a3)
{
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  v6 = 136315906;
  v7 = "-[SMBSocket processReply:]";
  v8 = 2048;
  v9 = v3;
  v10 = 1024;
  v11 = v4;
  v12 = 1024;
  v13 = v5;
  _os_log_error_impl(&dword_23028F000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s: drop response: message_id %lld, cmd %d status 0x%x\n", (uint8_t *)&v6, 0x22u);
}

- (void)processReply:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: No event handler, thus ignoring lease break \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)processReply:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Out of memory for saving final Session Setup reply. \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)processReply:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Session Setup reply too big <%zu>??? \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)processReply:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_2(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Non compound reply to compound req. message_id %lld, cmd %d\n", a5, a6, a7, a8, 2u);
}

- (void)readData:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: nw_connection_read_buffer failed \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)readData:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: smb_mbuf_get failed <%d> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)readData:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: Unknown NetBIOS Msg Type: <0x%x> \n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

void __22__SMBSocket_readData___block_invoke_cold_1(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  strerror(a1);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: nw_connection_read_buffer callback failed <%s> \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __25__SMBSocket_readNBHeader__block_invoke_cold_1(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  strerror(a1);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: nw_connection_read_buffer callback failed <%s> \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __25__SMBSocket_readNBHeader__block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: nw_connection_read_buffer callback got null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __25__SMBSocket_readNBHeader__block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: nw_connection_read_buffer callback got 0 data \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)send:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: rqp is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)send:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: sessionp is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)send:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: Malloc failed for netBIOS header \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)send:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: mbp is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)send:(uint64_t)a3 .cold.5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_23028F000, MEMORY[0x24BDACB70], a3, "%s: mb_top is null \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __18__SMBSocket_send___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "sr_messageid");
  OUTLINED_FUNCTION_5_2(&dword_23028F000, MEMORY[0x24BDACB70], v1, "%s: nw_connection_send failed <%d> for message ID <%llu> \n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_6_0();
}

void __25__SMBSocket_sendRequest___block_invoke_4_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_23028F000, MEMORY[0x24BDACB70], v0, "%s: SMB3 transform failed, error: %d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1();
}

@end
