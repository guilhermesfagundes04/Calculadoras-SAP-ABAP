* Parte 1 - Exercício 2 *
" Montar uma calculadora com as 4 operações para 4 números (algum número informado for 0 ou branco) não considerar.

REPORT zrgsf_p1ex2.

START-OF-SELECTION.

  TYPES: ty_decimals TYPE p DECIMALS 2.

  PARAMETERS: p_oper(1) TYPE c,
              p_valor1  TYPE ty_decimals,
              p_valor2  TYPE ty_decimals,
              p_valor3  TYPE ty_decimals,
              p_valor4  TYPE ty_decimals.

  DATA: lv_result   TYPE ty_decimals,
        lv_iniciado TYPE i VALUE 0.

START-OF-SELECTION.

  PERFORM zf_tratamento.

END-OF-SELECTION.

FORM zf_tratamento.

  CASE p_oper.

    WHEN '+'.
      lv_result = 0.
      IF p_valor1 NE 0.
        lv_result = lv_result + p_valor1.
      ENDIF.
      IF p_valor2 NE 0.
        lv_result = lv_result + p_valor2.
      ENDIF.
      IF p_valor3 NE 0.
        lv_result = lv_result + p_valor3.
      ENDIF.
      IF p_valor4 NE 0.
        lv_result = lv_result + p_valor4.
      ENDIF.
      WRITE: |O resultado da soma é: { lv_result }|.

    WHEN '-'.
      IF p_valor1 NE 0 AND lv_iniciado = 0.
        lv_result = p_valor1.
        lv_iniciado = 1.
      ENDIF.
      IF p_valor2 NE 0 AND lv_iniciado = 0.
        lv_result = p_valor2.
        lv_iniciado = 1.
      ELSEIF p_valor2 NE 0.
        lv_result = lv_result - p_valor2.
      ENDIF.
      IF p_valor3 NE 0 AND lv_iniciado = 0.
        lv_result = p_valor3.
        lv_iniciado = 1.
      ELSEIF p_valor3 NE 0.
        lv_result = lv_result - p_valor3.
      ENDIF.
      IF p_valor4 NE 0 AND lv_iniciado = 0.
        lv_result = p_valor4.
        lv_iniciado = 1.
      ELSEIF p_valor4 NE 0.
        lv_result = lv_result - p_valor4.
      ENDIF.
      WRITE: |O resultado da subtração é: { lv_result }|.

    WHEN '*'.
      lv_result = 1.
      IF p_valor1 NE 0.
        lv_result = lv_result * p_valor1.
      ENDIF.
      IF p_valor2 NE 0.
        lv_result = lv_result * p_valor2.
      ENDIF.
      IF p_valor3 NE 0.
        lv_result = lv_result * p_valor3.
      ENDIF.
      IF p_valor4 NE 0.
        lv_result = lv_result * p_valor4.
      ENDIF.
      IF lv_result NE 1.
        WRITE: |O resultado da multiplicação é: { lv_result }|.
      ELSE.
        MESSAGE 'Não é possível realizar multiplicação sem valores' TYPE 'E'.
      ENDIF.

    WHEN '/'.
      IF p_valor1 NE 0 AND lv_iniciado = 0.
        lv_result = p_valor1.
        lv_iniciado = 1.
      ENDIF.
      IF p_valor2 NE 0 AND lv_iniciado = 0.
        lv_result = p_valor2.
        lv_iniciado = 1.
      ELSEIF p_valor2 GT 0 OR p_valor2 LT 0.
        IF p_valor2 NE 0. lv_result = lv_result / p_valor2. ENDIF.
      ENDIF.
      IF p_valor3 NE 0 AND lv_iniciado = 0.
        lv_result = p_valor3.
        lv_iniciado = 1.
      ELSEIF p_valor3 GT 0 OR p_valor3 LT 0.
        IF p_valor3 NE 0. lv_result = lv_result / p_valor3. ENDIF.
      ENDIF.
      IF p_valor4 NE 0 AND lv_iniciado = 0.
        lv_result = p_valor4.
        lv_iniciado = 1.
      ELSEIF p_valor4 GT 0 OR p_valor4 LT 0.
        IF p_valor4 NE 0. lv_result = lv_result / p_valor4. ENDIF.
      ENDIF.
      WRITE: |O resultado da divisão é: { lv_result }|.

    WHEN OTHERS.
      MESSAGE 'Operação inválida' TYPE 'E'.

  ENDCASE.

ENDFORM.
