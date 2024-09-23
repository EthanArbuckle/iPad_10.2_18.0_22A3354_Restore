@implementation PTRandom

- (PTRandom)initWithSeed:(unsigned int)a3
{
  PTRandom *v4;
  PTRandom *v5;
  uint64_t v6;
  uint64_t i;
  unsigned int v8;
  PTRandom *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PTRandom;
  v4 = -[PTRandom init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_mt.__x_[0] = a3;
    v6 = 1;
    for (i = 3; i != 626; ++i)
    {
      v8 = 1812433253 * (a3 ^ (a3 >> 30));
      a3 = v8 + v6;
      *((_DWORD *)&v4->super.isa + i) = i + v8 - 2;
      ++v6;
    }
    v4->_mt.__i_ = 0;
    v9 = v4;
  }

  return v5;
}

- (double)nextFloat
{
  mersenne_twister_engine<unsigned int, 32UL, 624UL, 397UL, 31UL, 2567483615U, 11UL, 4294967295U, 7UL, 2636928640U, 15UL, 4022730752U, 18UL, 1812433253U> *p_mt;
  double v3;

  p_mt = &self->_mt;
  v3 = (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)&self->_mt);
  return (v3
        + (double)std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()((std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)p_mt)
        * 4294967300.0)
       * 5.42101086e-20
       + 0.0;
}

- (double)nextGauss
{
  __int128 v3;
  char v4;

  v3 = xmmword_1C9322C10;
  v4 = 0;
  return std::normal_distribution<double>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v3, (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)&self->_mt, (double *)&v3);
}

- (unsigned)nextUint:(unsigned int)a3
{
  _DWORD v4[2];

  v4[0] = 0;
  v4[1] = a3;
  return std::uniform_int_distribution<unsigned int>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((int)v4, (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)&self->_mt, v4);
}

- (double)nextUshort2:(int)a3
{
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *v3;
  unsigned int v4;
  _DWORD v6[2];

  v6[0] = 0;
  v6[1] = a3;
  v3 = (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)(a1 + 8);
  v4 = std::uniform_int_distribution<unsigned int>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((int)v6, (std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *)(a1 + 8), v6);
  return COERCE_DOUBLE(__PAIR64__(std::uniform_int_distribution<unsigned int>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((int)v6, v3, v6), v4));
}

+ (double)nextUshort2:(int)a3 seed:(std:()32 :()624 mersenne_twister_engine<unsigned)int
{
  uint64_t i;
  unsigned int v5;
  _DWORD v7[2];
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> v8;

  v8.__x_[0] = a4;
  for (i = 1; i != 624; ++i)
  {
    a4 = i + 1812433253 * (a4 ^ (a4 >> 30));
    v8.__x_[i] = a4;
  }
  v8.__i_ = 0;
  v7[0] = 0;
  v7[1] = a3;
  v5 = std::uniform_int_distribution<unsigned int>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((int)v7, &v8, v7);
  return COERCE_DOUBLE(__PAIR64__(std::uniform_int_distribution<unsigned int>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((int)v7, &v8, v7), v5));
}

- (id).cxx_construct
{
  unsigned int v2;
  uint64_t v3;
  uint64_t i;
  int v5;

  v2 = 5489;
  *((_DWORD *)self + 2) = 5489;
  v3 = 1;
  for (i = 3; i != 626; ++i)
  {
    v5 = 1812433253 * (v2 ^ (v2 >> 30));
    v2 = v5 + v3;
    *((_DWORD *)self + i) = i + v5 - 2;
    ++v3;
  }
  *((_QWORD *)self + 313) = 0;
  return self;
}

@end
