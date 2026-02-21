* Parte 1 - Exercício 1 *
" Montar uma calculadora com as 4 operações para 2 números.

REPORT zrgsf_p1ex1.

TYPES: ty_decimals TYPE p DECIMALS 2.

PARAMETERS: p_oper(1) TYPE c,
            p_valor1  TYPE ty_decimals,
            p_valor2  TYPE ty_decimals.

DATA: lv_soma TYPE ty_decimals,
      lv_subt TYPE ty_decimals,
      lv_mult TYPE ty_decimals,
      lv_divi TYPE ty_decimals.

START-OF-SELECTION.

  PERFORM zf_tratamento.

END-OF-SELECTION.

FORM zf_tratamento.

  CASE p_oper.
    WHEN '+'.
      lv_soma = p_valor1 + p_valor2.
      WRITE: |O resultado da soma é: { lv_soma }!|.
    WHEN '-'.
      lv_subt = p_valor1 - p_valor2.
      WRITE: |O resultado da subtração é: { lv_subt }!|.
    WHEN '*'.
      lv_mult = p_valor1 * p_valor2.
      WRITE: |O resultado da multiplicação é: { lv_mult }!|.
    WHEN '/'.
      IF p_valor2 NE 0. "Se o valor for diferente de 0, executa a divisão.
        lv_divi = p_valor1 / p_valor2.
        WRITE: |O resultado da divisão é: { lv_divi }!|.
      ELSE.
        WRITE: 'Erro, não é possível fazer divisão por 0!'.
      ENDIF.
    WHEN OTHERS.
      MESSAGE 'Operação inválida' TYPE 'E'.
  ENDCASE.

ENDFORM.
