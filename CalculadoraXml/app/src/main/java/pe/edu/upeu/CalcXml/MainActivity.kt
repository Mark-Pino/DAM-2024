package pe.edu.upeu.CalcXml

import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.EditText
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {
    lateinit var valorResultado:EditText
    private var operador=""
    private var numActual=0.0
    private var numAnt=0.0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        valorResultado=findViewById(R.id.txtResult)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        setupButtons()
    }

    fun setupButtons(){
        val buttons= arrayOf(R.id.btn7,R.id.btn8,R.id.btn9,
            R.id.btn4,R.id.btn5,R.id.btn6,R.id.btn1,R.id.btn2,R.id.btn3,R.id.btn0,R.id.btnPunto,R.id.btnMult,R.id.btnDiv,R.id.btnSuma,
            R.id.btnResta,R.id.btnIgual,R.id.btnBorrar)
        for (button in buttons){
            val bottonx=findViewById<Button>(button)
            bottonx.setOnClickListener{ onButtonClick(bottonx)}
        }
    }

    fun onButtonClick(view:View){
        when(view.id){
            R.id.btn7,R.id.btn8,R.id.btn9,
            R.id.btn4,R.id.btn5,R.id.btn6,
            R.id.btn1,R.id.btn2,R.id.btn3,
            R.id.btn0->{
                val bottonx=findViewById<Button>(view.id)
                appendToInput(bottonx.text.toString())
            }
            R.id.btnSuma, R.id.btnResta,
            R.id.btnMult,R.id.btnDiv->{
                val bottonx=findViewById<Button>(view.id)
                setOperador(bottonx.text.toString())
            }
            R.id.btnIgual->{calcularResultado()}
            R.id.btnBorrar->{
                valorResultado.text.clear()
                operador=""
                numActual=0.0
                numAnt=0.0
            }
        }
    }

    fun appendToInput(valor:String){
        valorResultado.append(valor)
    }

    fun setOperador(oper:String){
        operador=oper
        numAnt=valorResultado.text.toString().toDouble()
        valorResultado.text.clear()
    }

    fun calcularResultado(){
        numActual=valorResultado.text.toString().toDouble()
        val result=when(operador){
            "+"->numAnt+numActual
            "-"->numAnt-numActual
            "*"->numAnt*numActual
            "/"->numAnt/numActual
            else ->numAnt
        }
        valorResultado.setText(result.toString())
        operador=""
    }
}