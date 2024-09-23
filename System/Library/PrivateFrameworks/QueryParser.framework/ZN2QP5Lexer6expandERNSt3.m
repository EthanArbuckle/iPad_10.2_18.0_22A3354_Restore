@implementation ZN2QP5Lexer6expandERNSt3

char *___ZN2QP5Lexer6expandERNSt3__13setINS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS1_4lessIS8_EENS6_IS8_EEEERNS1_6vectorINS1_10shared_ptrINS_6LexemeEEENS6_ISH_EEEESK__block_invoke(uint64_t a1, __int128 *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;

  if (*(_WORD *)(*(_QWORD *)a2 + 88) == 15)
  {
    v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v5 = (uint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48)
                 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) >> 4;
    v6 = (uint64_t *)v4[6];
    v7 = v4[7];
    if ((unint64_t)v6 >= v7)
    {
      v9 = (uint64_t *)v4[5];
      v10 = v6 - v9;
      if ((unint64_t)(v10 + 1) >> 61)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v11 = v7 - (_QWORD)v9;
      v12 = (uint64_t)(v7 - (_QWORD)v9) >> 2;
      if (v12 <= v10 + 1)
        v12 = v10 + 1;
      if (v11 >= 0x7FFFFFFFFFFFFFF8)
        v13 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v13 = v12;
      if (v13)
      {
        v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long>>((uint64_t)(v4 + 7), v13);
        v9 = (uint64_t *)v4[5];
        v6 = (uint64_t *)v4[6];
      }
      else
      {
        v14 = 0;
      }
      v15 = (uint64_t *)&v14[8 * v10];
      v16 = &v14[8 * v13];
      *v15 = v5;
      v8 = v15 + 1;
      while (v6 != v9)
      {
        v17 = *--v6;
        *--v15 = v17;
      }
      v4[5] = v15;
      v4[6] = v8;
      v4[7] = v16;
      if (v9)
        operator delete(v9);
    }
    else
    {
      *v6 = v5;
      v8 = v6 + 1;
    }
    v4[6] = v8;
  }
  return std::vector<std::shared_ptr<QP::Lexeme>>::emplace_back<std::shared_ptr<QP::Lexeme>&>((char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

char *___ZN2QP5Lexer6expandERNSt3__13setINS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS1_4lessIS8_EENS6_IS8_EEEERNS1_6vectorINS1_10shared_ptrINS_6LexemeEEENS6_ISH_EEEESK__block_invoke_2(uint64_t a1, __int128 *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;

  if (*(_WORD *)(*(_QWORD *)a2 + 88) == 15)
  {
    v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v5 = (uint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48)
                 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) >> 4;
    v6 = (uint64_t *)v4[6];
    v7 = v4[7];
    if ((unint64_t)v6 >= v7)
    {
      v9 = (uint64_t *)v4[5];
      v10 = v6 - v9;
      if ((unint64_t)(v10 + 1) >> 61)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v11 = v7 - (_QWORD)v9;
      v12 = (uint64_t)(v7 - (_QWORD)v9) >> 2;
      if (v12 <= v10 + 1)
        v12 = v10 + 1;
      if (v11 >= 0x7FFFFFFFFFFFFFF8)
        v13 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v13 = v12;
      if (v13)
      {
        v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long>>((uint64_t)(v4 + 7), v13);
        v9 = (uint64_t *)v4[5];
        v6 = (uint64_t *)v4[6];
      }
      else
      {
        v14 = 0;
      }
      v15 = (uint64_t *)&v14[8 * v10];
      v16 = &v14[8 * v13];
      *v15 = v5;
      v8 = v15 + 1;
      while (v6 != v9)
      {
        v17 = *--v6;
        *--v15 = v17;
      }
      v4[5] = v15;
      v4[6] = v8;
      v4[7] = v16;
      if (v9)
        operator delete(v9);
    }
    else
    {
      *v6 = v5;
      v8 = v6 + 1;
    }
    v4[6] = v8;
  }
  return std::vector<std::shared_ptr<QP::Lexeme>>::emplace_back<std::shared_ptr<QP::Lexeme>&>((char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

char *___ZN2QP5Lexer6expandERNSt3__13setINS1_12basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS1_4lessIS8_EENS6_IS8_EEEERNS1_6vectorINS1_10shared_ptrINS_6LexemeEEENS6_ISH_EEEESK__block_invoke_3(uint64_t a1, __int128 *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;

  if (*(_WORD *)(*(_QWORD *)a2 + 88) == 15)
  {
    v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v5 = (uint64_t)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48)
                 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) >> 4;
    v6 = (uint64_t *)v4[6];
    v7 = v4[7];
    if ((unint64_t)v6 >= v7)
    {
      v9 = (uint64_t *)v4[5];
      v10 = v6 - v9;
      if ((unint64_t)(v10 + 1) >> 61)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v11 = v7 - (_QWORD)v9;
      v12 = (uint64_t)(v7 - (_QWORD)v9) >> 2;
      if (v12 <= v10 + 1)
        v12 = v10 + 1;
      if (v11 >= 0x7FFFFFFFFFFFFFF8)
        v13 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v13 = v12;
      if (v13)
      {
        v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long>>((uint64_t)(v4 + 7), v13);
        v9 = (uint64_t *)v4[5];
        v6 = (uint64_t *)v4[6];
      }
      else
      {
        v14 = 0;
      }
      v15 = (uint64_t *)&v14[8 * v10];
      v16 = &v14[8 * v13];
      *v15 = v5;
      v8 = v15 + 1;
      while (v6 != v9)
      {
        v17 = *--v6;
        *--v15 = v17;
      }
      v4[5] = v15;
      v4[6] = v8;
      v4[7] = v16;
      if (v9)
        operator delete(v9);
    }
    else
    {
      *v6 = v5;
      v8 = v6 + 1;
    }
    v4[6] = v8;
  }
  return std::vector<std::shared_ptr<QP::Lexeme>>::emplace_back<std::shared_ptr<QP::Lexeme>&>((char **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

@end
