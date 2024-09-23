void Factory::Factory(Factory *this)
{
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = &unk_251CC1E10;
}

void Factory::~Factory(Factory *this)
{
  std::__shared_weak_count *v1;

  v1 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void Registry::Registry(Registry *this)
{
  char *v2;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v2 = (char *)operator new(0x48uLL);
  *((_QWORD *)v2 + 1) = 0;
  *((_QWORD *)v2 + 2) = 0;
  *(_QWORD *)v2 = off_251CC1E80;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *((_QWORD *)this + 3) = v2;
  *(_OWORD *)(v2 + 24) = 0u;
  *((_QWORD *)this + 2) = v2 + 24;
}

{
  char *v2;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v2 = (char *)operator new(0x48uLL);
  *((_QWORD *)v2 + 1) = 0;
  *((_QWORD *)v2 + 2) = 0;
  *(_QWORD *)v2 = off_251CC1E80;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *((_QWORD *)this + 3) = v2;
  *(_OWORD *)(v2 + 24) = 0u;
  *((_QWORD *)this + 2) = v2 + 24;
}

uint64_t Registry::getServerConnection@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  v2 = *(uint64_t **)(this + 16);
  v4 = *v2;
  v3 = v2[1];
  *a2 = v4;
  a2[1] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return this;
}

uint64_t Registry::getRouterServer@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  v2 = *(_QWORD *)(this + 16);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  *a2 = v4;
  a2[1] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return this;
}

uint64_t Registry::getCommandDriverFactory@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;

  v2 = *(_QWORD *)(this + 16);
  v4 = *(_QWORD *)(v2 + 32);
  v3 = *(_QWORD *)(v2 + 40);
  *a2 = v4;
  a2[1] = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  return this;
}

uint64_t Registry::getRegistryModel(Registry *this)
{
  return (uint64_t)this + 16;
}

void std::__shared_ptr_emplace<RegistryModel>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_251CC1E80;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<RegistryModel>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_251CC1E80;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<RegistryModel>::__on_zero_shared(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;

  v2 = (std::__shared_weak_count *)a1[8];
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    v5 = (std::__shared_weak_count *)a1[6];
    if (!v5)
      goto LABEL_11;
  }
  else
  {
LABEL_5:
    v5 = (std::__shared_weak_count *)a1[6];
    if (!v5)
      goto LABEL_11;
  }
  v6 = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (!v7)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
LABEL_11:
  v8 = (std::__shared_weak_count *)a1[4];
  if (v8)
  {
    v9 = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void operator delete(void *__p)
{
  off_251CC1DF0(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_251CC1DF8(__sz);
}
